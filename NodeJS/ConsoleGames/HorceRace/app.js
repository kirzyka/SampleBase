/* 
	import
*/
var lib = require('../GLib/lib.js');
var rl = require('readline');

/* 
	const
*/
const TITLE = 'Game: Horserace\n';
const PLAYERS_LIST = 'Horses in race:';
const BET_PROMPT = 'Your bet? ';
const ERROR_BET = 'Enter correct horse number.';
const RACE_FINISHED = 'Race is finished.\nWinners:';
const MSG_WIN = 'You win!';
const MSG_LOSE = 'You lose!';

var SEPARATOR = new Array(20).join('-');
var BORDER = new Array(50).join('=') + '|';
var ROAD_DELIM = new Array(50).join('.') + '|';
var ROAD_SYMB = ' ';
var PLAYER_SYMB = '@';
var STAR_SYMB = '*';

/* 
	var
*/
var input = rl.createInterface({
  input: process.stdin,
  output: process.stdout
});
var i = 0;
var status = 0;
var bet = 0;
var players = [
	{ name: 'star', pos: 0 },
	{ name: 'joker', pos: 0 },
	{ name: 'salut', pos: 0 }
	];
var winners = [];

/* 
	function
*/
var drawRace = function() {
	if(!status) {
		lib.cls(0);	
		console.log(BORDER);
		for(var i = 0; i < players.length; i++) {
			console.log(lib.getPad(players[i].pos, ROAD_SYMB) + PLAYER_SYMB);
			console.log((i < players.length - 1) ? ROAD_DELIM : BORDER);
			if(players[i].pos >= BORDER.length) {
				status = 1;
				winners.push(players[i]);
			}
			players[i].pos += lib.getRandomInt(1,3);			
		}
		setTimeout(drawRace, 500);
	} else {
		showWinners();
	}

}

var showPlayers = function () {
	console.log(PLAYERS_LIST);
	for(var i = 0; i < players.length; i++) {
		console.log((i + 1) + lib.getPad(3, ROAD_SYMB), players[i].name);
	}
}

var getBet = function () {
	input.question(BET_PROMPT, function(answer) {
		if(answer < 1 || answer > players.length) {
			console.log(ERROR_BET);
			getBet();
			return;
		}	  

		bet = answer;
		drawRace();

		input.close();
		process.stdin.destroy();
	});
}

var showWinners = function () {
	console.log(RACE_FINISHED);
	for(var i = 0; i < winners.length; i++) {
		console.log(lib.getPad(1, STAR_SYMB), winners[i].name);
	}
	checkResult();
}

var checkResult = function() {
	var winner = false;
	console.log(SEPARATOR);
	for (var i = 0; i < players.length; i++) {
		if(winners.indexOf(players[i]) != -1 && (bet - 1) == i) {
			winner = true;
		}
	}
	console.log(winner ? MSG_WIN : MSG_LOSE);
}	


// START
lib.cls();
lib.animPrint(TITLE, 100)
	.then(function() {		
		console.log(SEPARATOR);
		showPlayers();
		getBet();
	});