'use strict';

var Utils = require('./utils.js');

function Primedice(apiKey) {
	this._apiKey = apiKey || "";
	this.isFake = true;
	this.user = 123;
}

Primedice.prototype.users = function() {

	var err,
		userName,
		callback;

	if (arguments.length == 1) {
		userName = 1;
		callback = arguments[0];
	} else {
		userName = arguments[0];
		callback = arguments[1];
	}

	callback(err, { user: this.user });
};

Primedice.prototype.bet = function(amount, target, condition, callback) {
	var err, 
		data = { bet: {}, user: {} },
		roll = Utils.getRandomNum(0, 100),
		payout = Utils.calcPayout(Utils.calcChance(condition, null, target)),
		win;

	if(condition == '>') {
		win = roll > target;
	} else {
		win = roll < target;
	}

	data.bet = {
		amount: amount,
		multiplier: payout,
		profit: win ? (amount * payout) - amount : -amount,
		target: target,
		condition: condition,
		roll: roll.toFixed(2) - 0,
		win: win
	};

	this.user.balance += data.bet.profit;
	data.user = this.user;


    callback(err, data);
};

module.exports = Primedice;