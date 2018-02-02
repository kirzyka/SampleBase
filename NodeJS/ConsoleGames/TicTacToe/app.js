/* 
	import
*/
var lib = require('../GLib/lib.js');
var rl = require('readline');

/* 
	const
*/
const TITLE = 'TIC TAC TOE\n';
var SEPARATOR = new Array(16).join('-');
const EMPTY_SYMB = ' ';
const P1_SYMB = '0';
const P2_SYMB = 'X';
const H_BORDER = '-';
const V_BORDER = '|';

/* 
	var
*/
var input = rl.createInterface({
  input: process.stdin,
  output: process.stdout
});
var i = 0;
var p1Turn = true;
var board = [
	[0,0,0],
	[0,0,0],
	[0,0,0]
];

/* 
	function
*/
var drawBoard = function () {
	var row, rowS = '';
	console.log('  1 2 3');
	console.log(' ' + lib.getPad(7, H_BORDER));
	for(var i = 0; i < board.length; i++) {
		row = board[i];
		rowS = (i + 1) + V_BORDER;
		for(var j = 0; j < row.length; j++) {
			rowS += row[j] > 0  ? row[j] > 1 ? P2_SYMB : P1_SYMB : EMPTY_SYMB;
			rowS += V_BORDER;
		}
		console.log(rowS);
	}
	console.log(' ' + lib.getPad(7, H_BORDER));
	console.log(SEPARATOR);

	input.question((p1Turn ? 'P1' : 'P2') + ' turn: ', function(answer) {
		if(!answer || answer.length != 2) {
			console.log('Wrong param');
			drawBoard();
		} else {
			var pos = answer.split('');
			board[pos[0]][pos[1]] = p1Turn ? 1 : 2;
			p1Turn = !p1Turn;
			drawBoard();
		}
	});
}

// START
lib.cls();
lib.animPrint(TITLE)
	.then(function () {
		console.log(SEPARATOR);
		drawBoard();	
	});
