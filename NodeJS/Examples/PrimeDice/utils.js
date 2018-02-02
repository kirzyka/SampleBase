'use strict';

var Utils = {};

function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min)) + min;
}

function getRandomNum(min, max) {
  return Math.random() * (max - min) + min;
}

function calcPayout(chance) {
    var n = 100 * chance,
	   	a = Math.floor((1e4 - 1e4 * 0.01) / n * 1e5) / 1e5;
	return String(a) - 0;
};

function calcChance(condition, payout, level) {
	var c;
	if(payout) {
		c = 100 * (1 - 0.01) / payout;
	} else {
		c = condition == '>' ? 99.99 - level : level;
	}
    return c.toFixed(2) - 0;
}

function calcLevel(condition, payout, chance) {
	var c = calcChance(condition, payout) || chance;
	return (condition == '>' ? 99.99 - c : c).toFixed(2) - 0;
}

Utils.getRandomInt = getRandomInt;
Utils.getRandomNum = getRandomNum;
Utils.calcPayout = calcPayout;
Utils.calcChance = calcChance;
Utils.calcLevel = calcLevel;

module.exports = Utils;