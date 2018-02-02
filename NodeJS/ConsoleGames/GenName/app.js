/* 
	import
*/
var lib = require('../GLib/lib.js');
var input;

var vow = []
	.concat(new Array(12).join('о').split(''))
	.concat(new Array(9).join('е').split(''))
	.concat(new Array(8).join('а').split(''))
	.concat(new Array(8).join('и').split(''))
	.concat(new Array(4).join('у').split(''))
	.concat(new Array(4).join('я').split(''))
	.concat(new Array(3).join('ы').split(''))
	.concat(new Array(2).join('ю').split('')) 
	.concat(new Array(2).join('э').split(''))
	.concat(new Array(2).join('ё').split('')); 

var con = []
	.concat(new Array(8).join('т').split(''))
	.concat(new Array(8).join('н').split(''))
	.concat(new Array(7).join('с').split(''))
	.concat(new Array(6).join('р').split(''))
	.concat(new Array(6).join('в').split(''))
	.concat(new Array(5).join('л').split(''))
	.concat(new Array(4).join('к').split(''))
	.concat(new Array(4).join('м').split('')) 
	.concat(new Array(4).join('д').split(''))
	.concat(new Array(4).join('п').split(''))
	.concat(new Array(3).join('г').split(''))
	.concat(new Array(3).join('з').split(''))
	.concat(new Array(3).join('б').split(''))
	.concat(new Array(3).join('ч').split(''))
	.concat(new Array(2).join('й').split(''))
	.concat(new Array(2).join('х').split(''))
	.concat(new Array(2).join('Ъ').split(''))
	.concat(new Array(2).join('ж').split(''))
	.concat(new Array(2).join('ь').split(''))
	.concat(new Array(2).join('ш').split(''))
	.concat(new Array(2).join('ц').split(''))
	.concat(new Array(2).join('щ').split(''))
	.concat(new Array(2).join('ф').split(''));


var getRandomChar = function(set) {
	return set[lib.getRandomInt(0, set.length -1)];
};

var getMPart = function(data) {
	var result = [data[0], data[2]];
	var i;

	for (i = 0; i < data[1] - 2; i++) {
		if(result[i] == 1 && result[i+1] == 1) {	
			result.splice(i + 1, 0, 0);	
		} else if(result[i] == 0 && result[i+1] == 0) {	
			result.splice(i + 1, 0, 1);	
		} else if(i > 0 && result[i] == 0 && result[i-1] == 0) {	
			result.splice(i + 1, 0, 1);	
		} else if(i > 0 && result[i] == 1 && result[i-1] == 1) {	
			result.splice(i + 1, 0, 0);		
		} else {								
			result.splice(i + 1, 0, lib.getRandomInt(0,1));	
		}
	}

	return result;
};

var getPart = function (data) {
	var result = '';
	var code = '';
	var i, c;

	data = data.split('');
	if(data.length != 3) {
		result = '';
	} else {		

		code = getMPart(data);	

		for(i = 0; i < code.length; i++) {
			if(code[i] == 0) {
				с = getRandomChar(vow);
				if(i == 0 && (c == 'ы')) { c = 'о'; }
				result += с;
			} else if(code[i] == 1) {
				c = getRandomChar(con);
				if(i == 0 && (c == 'ь' || c == 'ъ' || c == 'й')) { c = 'т'; }
				result += c;
			} else {
				result += '*';
			}
		}		
	}

	return result;
};

var getName = function () {
	var result = '';
	var i;

	for(var i = 0; i < input.length; i++) {
		result += getPart(input[i]);
	}

	return lib.toTitleCase(result);
};


vow = lib.shuffle(vow);
con = lib.shuffle(con);


process.argv.forEach(function (val, index, array) {
	if(index == 2) {
		input = val.split('+');	
	}  
});

console.log(getName());