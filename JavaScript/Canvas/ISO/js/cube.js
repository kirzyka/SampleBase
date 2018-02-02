var width = 2.1;  //width with gap

var cubes = [];
var cubeBlueprint = [
	[[-1,-1,1], [-1,1,1], [1,1,1], [1,-1,1], "#FC6303"], //FRONT
	[[-1,-1,-1], [-1,-1,1], [1,-1,1], [1,-1,-1], "#02811a"], //BOTTOM
	[[-1,-1,-1], [1,-1,-1], [1,1,-1], [-1,1,-1], "#FF3730"], //BACK
	[[-1,1,-1], [1,1,-1], [1,1,1], [-1,1,1], "#013291"], //TOP
	[[1,-1,-1], [1,-1,1], [1,1,1], [1,1,-1], "#FFE900"], //LEFT
	[[-1,-1,-1], [-1,1,-1], [-1,1,1], [-1,-1,1], "#EFEFEF"] //RIGHT
];


function getSideColor(x, y, z, colorCode, color) {
	var colorDisplay = "#333333";
	if ((colorCode === 0 && z === 1) || (colorCode === 2 && z === -1) || (colorCode === 1 && y === -1) || (colorCode === 3 && y === 1) || (colorCode === 4 && x === 1) || (colorCode === 5 && x === -1)) {
		colorDisplay = color;
	}
	return colorDisplay;
}

function copyCubes(x, y, z, cnt) {
	var x1 = x * width;
	var y1 = y * width;
	var z1 = z * width;
	for (var i = 0; i < 6; i++) {
		var color = /*getSideColor(x, y, z, i,*/ cubeBlueprint[i][4]/*)*/;
		var newCube = [ 0, 0, 0, 0, color, i ];
		for (var j = 0; j < 4; j++) {
			newCube[j] = [cubeBlueprint[i][j][0] + x1, cubeBlueprint[i][j][1] + y1, cubeBlueprint[i][j][2] + z1, 0, 0, 0, cnt ];
		}
		cubes.push(newCube);
	}
}

var radTurn = Math.PI / -30;

//rotates the cubes
function rotateAxis(c) {
	return [c[0], Math.cos(radTurn) * c[1] - Math.sin(radTurn) * c[2], Math.sin(radTurn) * c[1] + Math.cos(radTurn) * c[2] ];
}

//Without this function we would have a disco effect with the drawing of lines!
function whosOnTop(a, b) {
	var xx = Math.min(a[0][2], a[1][2], a[2][2]) - Math.min(b[0][2], b[1][2], b[2][2]);
	return xx;
}

var left = [17,18,19,20,21,22,23,24,25];
var center = [9,10,11,12,13,14,15,16];
var right = [0,1,2,3,4,5,6,7,8];

var topp = [6,7,8,14,15,16,23,24,25];
var middle = [3,4,5,12,13,22,21,20];
var bottom = [0,1,2,9,10,11,19,18,17];

var turna0 = turna1 =  turna2 =  turna3 = false;
var turnb0 = turnb1 =  turnb2 =  turnb3 = false;
var turnc0 = false;

function calcNewPosition() {

	for (var i = 0; i < cubes.length; i++) {
		for (var j = 0; j < 4; j++) {

			var cubeId = cubes[i][j][6];

			var a0 = a1 = a2 = a3 = false;
			if(turna0) a0 = true;
			if(turna1) a1 = left.indexOf(cubeId)>=0;
			if(turna2) a2 = center.indexOf(cubeId)>=0;
			if(turna3) a3 = right.indexOf(cubeId)>=0;

			var b0 = b1 = b2 = b3 = false;
			if(turnb0) b0 = true;
			if(turnb1) b1 = topp.indexOf(cubeId)>=0;
			if(turnb2) b2 = middle.indexOf(cubeId)>=0;
			if(turnb3) b3 = bottom.indexOf(cubeId)>=0;

			var c0 = false;
			if(turnc0) c0 = true;


			var tempCube = [cubes[i][j][0], cubes[i][j][1], cubes[i][j][2]];
			//rotate on x axis
			if (a0 || a1 || a2 || a3) {
				tempCube = rotateAxis([tempCube[0], tempCube[1], tempCube[2]]);
				tempCube = [tempCube[0], tempCube[1], tempCube[2]];
			}
			//rotate on the y axis
			if (b0 || b1 || b2 || b3) {
				tempCube = rotateAxis([tempCube[1], tempCube[0], tempCube[2]]);
				tempCube = [tempCube[1], tempCube[0], tempCube[2]];
			}
			//rotate on z axis
			if (c0) {
				tempCube = rotateAxis([tempCube[2], tempCube[0], tempCube[1]]);
				tempCube = [tempCube[1], tempCube[2], tempCube[0]];
			}

			cubes[i][j] = [tempCube[0], tempCube[1], tempCube[2], tempCube[0] * (200 / (tempCube[2] - 20)), tempCube[1] * (200 / (tempCube[2] - 20)), tempCube[2] - 10, cubeId];
		}
	}
}





function renderCubes() {
	for (i = 0; i < cubes.length; i++) {
		if (Math.min(cubes[i][0][5], cubes[i][1][5], cubes[i][2][2]) < 0 && 0 < ((cubes[i][0][3] - cubes[i][1][3]) * (cubes[i][2][4] - cubes[i][1][4]) - (cubes[i][0][4] - cubes[i][1][4]) * (cubes[i][2][3] - cubes[i][1][3]))) {
			canvas.beginPath();
			for (a = 0; a < 4; a++) {
				(a == 0) ? canvas.moveTo(cubes[i][a][3] + canvasHeightHalved, cubes[i][a][4] + canvasHeightHalved) : canvas.lineTo(cubes[i][a][3] + canvasHeightHalved, cubes[i][a][4] + canvasHeightHalved);
			}
			canvas.closePath();
			canvas.fillStyle = cubes[i][4];
			canvas.strokeStyle = "#f0f0f0";
			canvas.fill();
			canvas.stroke();
		}
	}
}

function drawCubes() {
	calcNewPosition();
	cubes.sort(whosOnTop);
	renderCubes();
}
var canvas;
var canvasHeight = 300;
var canvasHeightHalved = canvasHeight / 2;
var canvasWidth = 700;
function initCube() {
	canvas = document.getElementById("mainCanvas").getContext("2d");
	//Generate the 3X3 grid of cubes where the center is at 0,0
	var cnt = 0;
	for (var x = -1; x < 2; x++) {
		for (var y = -1; y < 2; y++) {
			for (var z = -1; z < 2; z++) {
				if (x == 0 && y == 0 && z == 0) {
					continue; //No need to render the center cube
				}
				copyCubes(x, y, z, cnt++);
			}
		}
	}
	animateCube();
	turna0 = true;

}

initCube();

var stop = false;
var spinCounter = 0;

function animateCube() {
	canvas.fillStyle = "rgb(50,50,50)";
	canvas.fillRect(0, 0, canvasWidth, canvasHeight);
	drawCubes(canvas);
	//moveParts();
	if (!stop) setTimeout(animateCube, 75);
	if(turna0 || turna1 || turna2 || turna3 || turnb0 || turnb1 || turnb2 || turnb3 || turnc0)spinCounter+= 6; //radTurn;
}