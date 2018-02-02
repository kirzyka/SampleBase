'use strict';

var colors = require('colors');
var Utils = require('./utils.js'),
	Primedice = require('./primedice_f.js'),
	apiKey = '8fb7fa14-3d5d-452b-9006-8c49a9fccdb1',
	client = new Primedice(apiKey);

var N_ROLLS = 100,
	DEF_RED_LINE = 5,
	M = 2,
	DEF_PAYOUT = 5.5,
	DEF_AMOUNT = 0,	
	DEF_CONDITION = '>',
	LINE_L = '------------------------------------------',
	LINE_S = '--------------------';

var users = [
	{
		username: 'user1',
		balance:  250
	},
	{
		username: 'user2',
		balance:  700
	},
	{
		username: 'user3',
		balance:  2000
	}
];

var infinity,
	profit, 
	level,
	condition,
	payout,
	amount,
	roll,
	maxAmount,
	iRoll,
	user, bet, 
	stats,
	cWin, winIn, maxWinIn, maxWin,
	cLose, loseIn, maxLoseIn, maxLose,
	errorIn,
	level_1, level_2,
	sum,
	redLine,
	stack;

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
	level = 0;
	condition = DEF_CONDITION;
	payout = 0;	
	amount = DEF_AMOUNT;
	roll = 0;	

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
	sum = 0;
	redLine = DEF_RED_LINE;
	stack = [];
}

function getAmount(i, sum) {
	i = i || 1;
	sum = sum || 1;

	if((i * payout - i) > i + sum + M) {
		return i;
	} else {
		return getAmount(i + 1, sum);
	}
}

function updateStack(v) {
	if(stack.length == 50) {
		stack.pop();
	}
	stack.unshift(v);
}

function play() {	
	iRoll++;

	if(!infinity && iRoll == N_ROLLS) return showSummary();
	if(user && user.balance == 0) return showSummary();
	if(user && user.balance / 3 < amount) return showSummary();	

	level = Utils.calcLevel(condition, payout);

	client.bet(amount, level, condition, function(err, res) {		
		var msg,
			i, l;

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
				//process.stdout.write('Balance: ' + Math.round(user.balance) + ' Profit: ' + profit.toFixed(2) +' Bets: ' + Math.round(iRoll / N_ROLLS * 100) + ' %             \r');
				msg = ['Balance:', Math.round(user.balance), 'Amount:', amount, 'Roll:', res.bet.roll.toFixed(2), 'Condition:', condition, 'Profit:', res.bet.profit.toFixed(2), 'Bets:', iRoll, loseIn == redLine ? 'BET redLine:' + redLine : ''].join(' ');
				console.log(res.bet.profit > 0 ? msg.green : msg.red);
			} else {
				process.stdout.write('Balance: ' + Math.round(user.balance) + ' Profit: ' + profit.toFixed(2) + ' Bets: ' + iRoll + '             \r');				
			}
			
			//if(res.bet.win) {	
			if(res.bet.roll > level_1) {					
				cWin++;
				winIn++;
				loseIn = 0;
				if(maxWin < res.bet.profit) {
					maxWin = res.bet.profit;
					//console.log('Max Win:', Math.round(maxWin), '                           \r');					
				}	
				amount = DEF_AMOUNT;
				sum = 0;
			} else {	
				cLose++;
				loseIn++;
				winIn = 0;
				if(maxLose > res.bet.profit) {
					maxLose = res.bet.profit;
					//console.log('Max Lose:', Math.round(maxLose), '                           \r');					
				}

				l = user.balance < 1000 ? 17 : 20;

				if(loseIn > redLine && loseIn < DEF_RED_LINE + l) {
					amount = getAmount(amount, sum);
					sum += amount;
				} else {
					amount = DEF_AMOUNT;
					sum = 0;
				}
					
			}

			if(maxAmount < amount) maxAmount = amount;
			if(maxLoseIn < loseIn) maxLoseIn = loseIn;
			if(maxWinIn < winIn) maxWinIn = winIn;
			setTimeout(play, client.isFake ? 10 : 300);

		}
	});
}

reset();
infinity = true;
if(client.isFake) {
	// Set user for testing
	client.user = users[1];	
}

client.users(function(err, res) {
	if(err) {
		console.log(err);
		return;
	}

	payout = DEF_PAYOUT;
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