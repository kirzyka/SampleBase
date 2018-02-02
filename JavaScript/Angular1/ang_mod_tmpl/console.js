var sKey = ['A','B','C','D','E','F','G'];

String.prototype.replaceAt=function(index, character) {
	return this.substr(0, index) + character + this.substr(index+1);
}

function printMap(_map, spots) {
	for(var i=0; i<H; i++) {
		var l = _map[i].join('');
		for(var j=0; j<spots.length; j++) {
			var spot = spots[j];
			for(var k=0; k<spot.path.length; k++) {
				var point = spot.path[k];
				if(point.y == i) {
					l = l.replaceAt(point.x, sKey[spot.id%sKey.length]);
				}
			}
		}
		console.log(l)
	}
}

//-------------------


function copyArray(src) {
	var result = [];
	for(var i=0; i<src.length; i++) {
		result[i] = src[i].slice();
	}
	return result
}

function getSpots(a) {
	var tmp = copyArray(a);
	var result = [];

	var spot = {};
	var spotId = 0;

	for(var i=0; i<H; i++) {
		for(var j=0; j<W; j++) {
			if(tmp[i][j] == '.') {
				var path = getSpotCell(j,i,tmp,[],0);
				path = getContour(path, map, W, H);
				spot = {id: spotId, path: path};
				result.push(spot);
				spotId++;
			}
		}
	}

	return result;
};

function getSpotCell(x,y, map, path) {
	if(map[y][x] == '0') {
		map[y][x] = 'X';
		return path;
	}
	map[y][x] = 'X';
	path.push({x: x, y:y});

	if(x>0 && (map[y][x-1] == '.' || map[y][x-1] == '0')) path = path.concat(getSpotCell(x-1, y, map, []));
	if(y>0 && (map[y-1][x] == '.' || map[y-1][x] == '0')) path = path.concat(getSpotCell(x, y-1, map, []));
	if(x<W-1 && (map[y][x+1] == '.' || map[y][x+1] == '0')) path = path.concat(getSpotCell(x+1, y, map, []));
	if(y<H-1 && (map[y+1][x] == '.' || map[y+1][x] == '0')) path = path.concat(getSpotCell(x, y+1, map, []));
	return path;
}

function getContour(path, map, W, H) {
	var result = [];
	for(var i=0; i<path.length; i++) {
		var point = path[i];
		var c = 0;
		if(point.x>0 && casherCell(map[point.y][point.x-1])) c++;
		if(point.y>0 && casherCell(map[point.y-1][point.x])) c++;
		if(point.x<W-1 && casherCell(map[point.y][point.x+1])) c++;
		if(point.y<H-1 && casherCell(map[point.y+1][point.x])) c++;

		if(point.x>0 && point.y>0 && casherCell(map[point.y-1][point.x-1])) c++;
		if(point.x<W-1 && point.y>0 && casherCell(map[point.y-1][point.x+1])) c++;
		if(point.x>0 && point.y<H-1 && casherCell(map[point.y+1][point.x+1])) c++;
		if(point.x>0 && point.y<H-1 && casherCell(map[point.y+1][point.x-1])) c++;

		if(c != 8) result.push(point);
	}

	function casherCell(cell) {
		return cell == '.' || cell == '0';
	}

	return result;
}

function getNextPathPoint(x, y, path) {
	var minDist = 1/0;
	var _x, _y;
	for(var i=0; i<path.length; i++) {
		var d = dist(x,y, path[i].x, path[i].y);
		if(d < minDist && (x!= path[i].x || y != path[i].y)) {
			minDist = d;
			_x = path[i].x;
			_y = path[i].y;
		}
	}
	return {x: _x, y: _y}
}

function getNearestSpot(x, y, spots) {
	var result = {};
	var minDist = 1/0;
	for(var i=0; i<spots.length; i++) {
		var _spot = spots[i];
		for(var j=0; j<_spot.path.length; j++) {
			var d = dist(x,y, _spot.path[j].x,_spot.path[j].y);
			if(d < minDist && (x!= _spot.path[j].x || y != _spot.path[j].y)) {
				minDist = d;
				result = _spot;
			}
		}
	}
	return result;
}

function getNextPoint(k, x, y, map) {

	var x1 = -1*k + x;
	var x2 = k + x;
	var y1 = -1*k + y;
	var y2 = k + y;

	x1 = x1 > -1 ? x1 : x;
	x2 = x2 < W ? x2 : x;
	y1 = y1 > -1 ? y1 : y;
	y2 = y2 < H ? y2 : y;

	for(i=x1; i<x2; i++) {
		if(map[y1][i] == '.') return {x: i, y: y1}
		if(map[y2][i] == '.') return {x: i, y: y2}
	}
	for(i=y1; i<y2; i++) {
		if(map[i][x1] == '.') return {x: x1, y: i}
		if(map[i][x2] == '.') return {x: x2, y: i}
	}
	k++;
	return getNextPoint(k, x, y, map);
}

function dist(x1,y1,x2,y2){
	return Math.sqrt( (x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
}

var map = [
	['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'],
	['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'],
	['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'],
	['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'],
	['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'],
	['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'],
	['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'],
	['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'],
	['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'],
	['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'],
	['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'],
	['.','.','.','.','.','.','.','.','1','1','.','.','.','.','.','.','.','.','.','.'],
	['.','.','.','.','.','.','.','.','1','1','.','.','.','.','.','.','.','.','.','.'],
	['.','.','.','.','.','.','.','.','1','1','1','1','1','1','1','1','.','.','.','0'],
	['.','.','.','.','.','.','.','.','1','1','1','1','1','1','1','1','.','.','.','0'],
	['.','.','.','.','.','.','.','.','.','1','1','1','1','.','.','.','.','.','.','0'],
	['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','0'],
	['0','0','.','.','.','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'],
	['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'],
	['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.']
	];

var W = 20;
var H = 20;

var spots = getSpots(map);

printMap(map, spots);

