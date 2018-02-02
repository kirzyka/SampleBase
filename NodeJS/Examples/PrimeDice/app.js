'use strict';

var colors = require('colors');
var Utils = require('./utils.js'),
	Primedice = require('./primedice.js'),
	apiKey = '8fb7fa14-3d5d-452b-9006-8c49a9fccdb1',
	client = new Primedice(apiKey);

var stdin = process.openStdin();

var N_ROLLS = 100,
	DEF_AMOUNT = 1,
	DEF_CONDITION = '>',
	DEF_LEVEL = 50.49,
	MIN_LEVEL = 1.99,
	MAX_LEVEL = 98.99,
	LINE_L = '------------------------------------------',
	LINE_S = '--------------------';

var users = [
	{
		username: 'user1',
		balance:  250
	},
	{
		username: 'user2',
		balance:  1000
	},
	{
		username: 'user3',
		balance:  10000
	}
];

var infinity,
	profit, 
	level,
	condition,
	payout,
	winChance,
	amount,
	roll,
	cu, cd,
	maxAmount,
	iRoll,
	user, bet, 
	stats,
	cWin, winIn, maxWinIn, maxWin,
	cLose, loseIn, maxLoseIn, maxLose,
	errorIn,
	level_1, level_2,
	stack;

function showSummary() {
	var msg = [];
	msg.push('                                                                                        ') ;
	msg.push(LINE_L);
	//msg.push('Finished: ' + (iRoll == N_ROLLS));
	
	msg.push('Balance: ' + user.balance.toFixed(2));
	msg.push('Profit: ' + (profit.toFixed(2) - 0));
	msg.push(level_1 + '  -----  ' + condition + '  -----  ' + level_2);
	msg.push('Max Amount: ' + maxAmount.toFixed(2) + ' win: ' + cWin + '/' + maxWinIn + ' lose: ' + cLose + '/' + maxLoseIn);
	msg.push(LINE_L);

	msg = msg.join('\n');
	console.log(profit == 0 ? msg.yellow :  profit > 0 ? msg.green : msg.red);
}

function reset() {
	profit = 0;
	level = DEF_LEVEL;
	condition = DEF_CONDITION;
	payout = 0;	
	winChance = 0;	
	amount = DEF_AMOUNT;
	roll = 0;	
	cd = 0;
	cu = 0;

	maxAmount = 0;
	iRoll = 0;
	cWin = 0;
	winIn = 0;
	maxWinIn = 0;
	maxWin = 0;
	cLose = 0; 
	loseIn = 0; 
	maxLoseIn = 0;
	maxLose = 0;
	errorIn = 0;

	stack = [0, 0, 0, 0, 0];
}

function updateStack(roll) {
	var val = 'C',
		l1 = level_1 + level_1 / 100 * 20,
		l2 = level_2 - level_2 / 100 * 20;

	if(roll < l1) {
		val = 'L';
	} 
	if(roll > l2) {
		val = 'R';
	}	

	stack.pop(); 
	stack.unshift(val);
	//console.log(stack);
}

function analyzeStack() {
	var l = stack.reduce(function(v, i) { return (i == 'L') ? (v + 1) : v;}, 0),
	 	r = stack.reduce(function(v, i) { return (i == 'R') ? (v + 1) : v;}, 0);

	return `L ${100 - Math.round(l / stack.length * 100)} %  R ${100 - Math.round(r / stack.length * 100)} %`; 	
}

function play() {	
	iRoll++;

	//if(!infinity && iRoll == N_ROLLS) return showSummary();
	if(user && user.balance == 0) return showSummary();
	//if(user && user.balance < amount) return showSummary();	
	//if(user && user.balance < 150) return showSummary();

	level = Utils.calcLevel(condition, payout);

	client.bet(amount, level, condition, function(err, res) {		
		var msg;

		if(err) {
			//console.log(err);
			if(errorIn > 10) {
				console.log(err);
				return;	
			}
			setTimeout(play, 500);
			errorIn++;
		} else {	
			errorIn = 0;		
			profit += res.bet.profit;
			user = res.user;
			
			if(res.bet.win) {					
				cWin++;
				winIn++;
				loseIn = 0;
				if(maxWin < res.bet.profit) {
					maxWin = res.bet.profit;
					//console.log('Max Win:', Math.round(maxWin), '                           \r');					
				}
			} else {	
				cLose++;
				loseIn++;
				winIn = 0;
				if(maxLose > res.bet.profit) {
					maxLose = res.bet.profit;
					//console.log('Max Lose:', Math.round(maxLose), '                           \r');					
				}		
			}

			// Update stack
			if(res.bet.roll < level_1 && condition == '<') {
				condition = '>';
				console.log('Condition was changed'.cyan);				
			} 
			if(res.bet.roll > level_2 && condition == '>') {
				condition = '<';
				console.log('Condition was changed'.cyan);
			} 

			updateStack(res.bet.roll);			

			if(maxAmount < amount) maxAmount = amount;
			if(maxLoseIn < loseIn) maxLoseIn = loseIn;
			if(maxWinIn < winIn) maxWinIn = winIn;
			
			msg = ['Roll:', res.bet.roll.toFixed(2), 'Amount:', amount, 'Condition:', condition, 'Profit:', res.bet.profit.toFixed(2), 'Balance:', Math.round(user.balance)].join(' ');
			console.log(res.bet.profit > 0 ? msg.green : msg.red);
			console.log(analyzeStack().yellow);
			process.stdout.write('Input: ');
		}
	});
}

reset();
infinity = false;
if(client.isFake) {
	// Set user for testing
	client.user = users[1];	
}

payout = 1.08;

stdin.addListener("data", function(d) {
		var inp = d.toString().trim();

		inp = inp.split(' ');
		// condition
		// payout
		// amount

		if(inp.length > 0) {
			if(inp[0] == '') {
				console.log('---- Repeated ----');	
			} else if(inp[0] == '?') {
				showSummary();
				process.stdout.write('Input: ');
				return;
			} else {
				amount = inp[0].trim() - 0;
			}
		}
		
		if(inp.length > 1) {			
			condition = inp[1].trim();
		} 

		if(inp.length > 2) {
			payout = inp[2].trim() - 0;
			level_1 = Utils.calcLevel('>', payout);
			level_2 = Utils.calcLevel('<', payout);
			console.log(level_1 + '  -----  ' + condition + '  -----  ' + level_2);
		}		
		
		play();
	});

client.users(function(err, res) {
	if(err) {
		console.log(err);
		return;
	}
	
	level_1 = Utils.calcLevel('>', payout);
	level_2 = Utils.calcLevel('<', payout);
	user = res.user;

	console.log('User: ', user.username, 'Balance:', user.balance);
	console.log(level_1 + '  -----  ' + condition + '  -----  ' + level_2);
	console.log(LINE_S);
	process.stdout.write('Input: ');
});