var getRandomInt = function (min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
};	

var getPad = function (size, symb) {
	return new Array(size + 1).join(symb);
}

var toTitleCase = function (str) {
    return str.replace(/\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
};

var cls = function () {
	process.stdout.write('\033c');
};

var animPrint = function (str, delay) {
	delay = delay || 100;
	return new Promise((resolve, reject) => {
		var i = 0;
		var print = function () {
			if(i <= str.length) {
				process.stdout.write('\r');
				process.stdout.write(str.substr(0, i));
				i++;
				setTimeout(print, delay);
			} else {
				resolve();
			}	
		}

		print();
	});
};

var colorPrint = function (text, fColor, bColor) {
	fColor = fColor || module.exports.F_WHITE;
	bColor = bColor || module.exports.B_BLACK;
	console.log(fColor +'%s'+ bColor, text ,'\x1b[0m');
};

var shuffle = function(array) {
  var currentIndex = array.length, temporaryValue, randomIndex;

  // While there remain elements to shuffle...
  while (0 !== currentIndex) {

    // Pick a remaining element...
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex -= 1;

    // And swap it with the current element.
    temporaryValue = array[currentIndex];
    array[currentIndex] = array[randomIndex];
    array[randomIndex] = temporaryValue;
  }

  return array;
};

/*
	Public API
*/
module.exports.F_BLACK = '\x1b[30m';
module.exports.F_RED = '\x1b[31m';
module.exports.F_GREEN = '\x1b[32m';
module.exports.F_YELLOW = '\x1b[33m';
module.exports.F_BLUE = '\x1b[34m';
module.exports.F_MAGENTA = '\x1b[35m';
module.exports.F_CYAN = '\x1b[36m';
module.exports.F_WHITE = '\x1b[37m';

module.exports.B_BLACK = '\x1b[40m';
module.exports.B_RED = '\x1b[41m';
module.exports.B_GREEN = '\x1b[42m';
module.exports.B_YELLOW = '\x1b[43m';
module.exports.B_BLUE = '\x1b[44m';
module.exports.B_MAGENTA = '\x1b[45m';
module.exports.B_CYAN = '\x1b[46m';
module.exports.B_WHITE = '\x1b[47m';

module.exports.getRandomInt = getRandomInt;
module.exports.getPad = getPad;
module.exports.toTitleCase = toTitleCase;
module.exports.cls = cls;
module.exports.animPrint = animPrint;
module.exports.colorPrint = colorPrint;
module.exports.shuffle = shuffle;