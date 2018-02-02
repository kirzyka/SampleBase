var Utils = require('./utils.js');
var k = 5.5, m = 5, d = 1, i, sum = 1, w = 0, stats = [], l = 0, li = 0, ml =0;

function getRandomNum(min, max) {
  return Math.random() * (max - min) + min;
}
function getAmount(a, sum) {
	a = a || 1;
	sum = sum || 1;

	if(a * k - i > a + sum + m) {
		return a;
	} else {
		return getAmount(a + 1, sum);
	}
};


v = 1;
for(i = 0; i < 30; i++) {
	d = getAmount(v, sum);
	sum += d;
	console.log(d, sum);
}