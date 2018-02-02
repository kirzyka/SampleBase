'use strict';

var colors = require('colors');
var Utils = require('./utils.js'),
	Primedice = require('./primedice_f.js'),
	apiKey = '8fb7fa14-3d5d-452b-9006-8c49a9fccdb1',
	client = new Primedice(apiKey);

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
	stackD, stackU;

function showSummary() {
	var msg = [];
	msg.push('                                                                                        ') ;
	msg.push('Finished: ' + (iRoll == N_ROLLS));
	msg.push('Profit: ' + (profit.toFixed(2) - 0));
	msg.push('Balance: ' + user.balance.toFixed(2));
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

	stackD = [0, 0, 0, 0, 0];
	stackU = [0, 0, 0, 0, 0];
}

function updateStackD(val) {
	stackD.pop(); 
	stackD.unshift(val);
}

function updateStackU(val) {
	stackU.pop(); 
	stackU.unshift(val);
}
/*
function calcAmount() {
	var cn = stack.reduce(function(v, i) { return (i == 0) ? (v + 1) : v;}, 0),
		cl = stack.reduce(function(v, i) { return (i == -1) ? (v + 1) : v;}, 0),
		cw = stack.reduce(function(v, i) { return (i == 1) ? (v + 1) : v;}, 0);

	if(stack[0] == -1 && cn == 0) {
		if(cl == 1) {
			console.log('Stack:', stack, '                           \r');
			return 64;
		} else if(stack[1] == -1) {	
			return 128;
		} else {
			return 8;
		}
	} else {
		return DEF_AMOUNT;
	}
}
*/
function play() {	
	iRoll++;

	if(!infinity && iRoll == N_ROLLS) return showSummary();
	if(user && user.balance == 0) return showSummary();
	if(user && user.balance < amount) return showSummary();
	if(user.balance < amount) return showSummary();
	//if(user && user.balance < 150) return showSummary();

	level = Utils.calcLevel(condition, payout);

	client.bet(amount, level, condition, function(err, res) {		
		var msg,
			cd = stackD.reduce(function(v, i) { return (i == 1) ? (v + 1) : v;}, 0),
			cu = stackU.reduce(function(v, i) { return (i == 1) ? (v + 1) : v;}, 0);

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

			if(!infinity) {
				process.stdout.write('Balance: ' + Math.round(user.balance) + ' Profit: ' + profit.toFixed(2) +' Bets: ' + Math.round(iRoll / N_ROLLS * 100) + ' %             \r');
				msg = ['Balance:', Math.round(user.balance), 'Amount:', amount, 'Roll:', res.bet.roll.toFixed(2), 'Condition:', condition, 'Profit:', res.bet.profit.toFixed(2), 'Bets:', iRoll].join(' ');
				console.log(res.bet.profit > 0 ? msg.green : msg.red);
			} else {
				process.stdout.write('Balance: ' + Math.round(user.balance) + ' Profit: ' + profit.toFixed(2) +' Bets: ' + iRoll + '             \r');				
			}

			
			if(res.bet.win) {					
				cWin++;
				winIn++;
				loseIn = 0;
				if(maxWin < res.bet.profit) {
					maxWin = res.bet.profit;
					//console.log('Max Win:', Math.round(maxWin), '                           \r');					
				}
				amount = Math.max(DEF_AMOUNT, amount / 2);
			} else {	
				cLose++;
				loseIn++;
				winIn = 0;
				if(maxLose > res.bet.profit) {
					maxLose = res.bet.profit;
					//console.log('Max Lose:', Math.round(maxLose), '                           \r');					
				}
				/*if(loseIn == 1) {
					amount = Utils.getRandomInt(4, 64);
				} else if(loseIn == 2) {
					amount *= 1.1;
				//} else if(loseIn == 3) {
				//	amount = Math.min(1111, user.balance / 2);
				} else {*/
				amount = DEF_AMOUNT;	
				//}				
			}

			// Update stack
			if(res.bet.roll < level_1) {
				condition = '>';
				updateStackD(1);
				updateStackU(0);
				amount = 16;//Math.pow(2, cd);
			} else if(res.bet.roll > level_2) {
				condition = '<';
				updateStackD(0);
				updateStackU(1);
				amount = 16;//Math.pow(2, cu);
			} 

			if(maxAmount < amount) maxAmount = amount;
			if(maxLoseIn < loseIn) maxLoseIn = loseIn;
			if(maxWinIn < winIn) maxWinIn = winIn;
			setTimeout(play, client.isFake ? 10 : 300);
		}
	});
}

reset();
infinity = false;
if(client.isFake) {
	// Set user for testing
	client.user = users[1];	
}

client.users(function(err, res) {
	if(err) {
		console.log(err);
		return;
	}

	payout = 1.08;
	level_1 = Utils.calcLevel('>', payout);
	level_2 = Utils.calcLevel('<', payout);
	user = res.user;

	console.log('User: ', user.username, 'Balance:', user.balance);
	console.log('Level 1:', level_1);
	console.log('Level 2:', level_2);
	console.log(LINE_S);
	setTimeout(play, 500, infinity);
});

/*

*/

/*
function play() {
	iRoll++;

	if(iRoll == N_ROLLS) return showSummary();
	if(user && user.balance == 0) return showSummary();
	if(user && user.balance < amount) return showSummary();

	level = Utils.calcLevel(condition, payout);

	client.bet(amount, level, condition, function(err, res) {
		if(err) {
			console.log(err);
		} else {
			//console.log(res);
			profit += res.bet.profit;
			user = res.user;
			if(res.bet.win) {	
				cWin++;
				winIn++;
				loseIn = 0;
				amount = DEF_AMOUNT;	
			} else {		
				cLose++;
				loseIn++;
				winIn = 0;
				amount += amount;	
				//if(loseIn > 4) amount = DEF_AMOUNT;
				//if(amount > balance / 4) amount = DEF_AMOUNT;
			}
			if(maxAmount < amount) maxAmount = amount;
			if(maxLoseIn < loseIn) maxLoseIn = loseIn;
			if(maxWinIn < winIn) maxWinIn = winIn;
			setTimeout(play, 200);
		}
	});
}
*/