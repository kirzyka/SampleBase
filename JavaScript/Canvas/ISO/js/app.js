function Point(x, y, color) {
	this.x = x;
	this.y = y;
	this.color = color;
};

function Point3D(x, y, z, color) {
	this.x = x;
	this.y = y;
	this.z = z;
	this.color = color;
};

var source = [
	[
		['#FF0000', '#FF5500', '#FF5555'],
		['#FF0000', '#FF5500', '#FF5555'],
		['#FF0000', '#FF5500', '#FF5555'],
		['#FF0000', '#FF5500', '#FF5555'],
		['#FF0000', '#FF5500', '#FF5555'],
		['#FF0000', '#FF5500', '#FF5555']
	],
	[
		['#00FF00', '#55FF00', '#55FF55'],
		['#00FF00', '#55FF00', '#55FF55'],
		['#00FF00', '#55FF00', '#55FF55'],
		['#00FF00', '#55FF00', '#55FF55'],
		['#00FF00', '#55FF00', '#55FF55'],
		['#00FF00', '#55FF00', '#55FF55']
	]
];

var backgroundColour = '#0000FF';
var nodeColour = '#00FF00';
var edgeColour = '#FF0000';
var nodeSize = 8;

var createCuboid = function(x, y, z) {
	var w = 30;
	var h = 30;
	var d = 30;
	var nodes = [[x,   y,   z  ],
		[x,   y,   z+d],
		[x,   y+h, z  ],
		[x,   y+h, z+d],
		[x+w, y,   z  ],
		[x+w, y,   z+d],
		[x+w, y+h, z  ],
		[x+w, y+h, z+d]];
	var edges = [[0, 1], [1, 3], [3, 2], [2, 0],
		[4, 5], [5, 7], [7, 6], [6, 4],
		[0, 4], [1, 5], [2, 6], [3, 7]];
	return { 'nodes': nodes, 'edges': edges };
};

var object1 = createCuboid(20, 20, 10);
var object2 = createCuboid(60, 60, 30);
var object3 = createCuboid(100, 50, 30);
var objects = [];

var rotateZ3D = function(theta, nodes) {
	var sin_t = Math.sin(theta  * (Math.PI/180));
	var cos_t = Math.cos(theta  * (Math.PI/180));

	for (var n = 0; n < nodes.length; n++) {
		var node = nodes[n];
		var x = node[0];
		var y = node[1];
		node[0] = x * cos_t - y * sin_t;
		node[1] = y * cos_t + x * sin_t;
	}
};

var rotateY3D = function(theta, nodes) {
	var sin_t = Math.sin(theta  * (Math.PI/180));
	var cos_t = Math.cos(theta  * (Math.PI/180));

	for (var n = 0; n < nodes.length; n++) {
		var node = nodes[n];
		var x = node[0];
		var z = node[2];
		node[0] = x * cos_t - z * sin_t;
		node[2] = z * cos_t + x * sin_t;
	}
};

var rotateX3D = function(theta, nodes) {
	var sin_t = Math.sin(theta  * (Math.PI/180));
	var cos_t = Math.cos(theta  * (Math.PI/180));

	for (var n = 0; n < nodes.length; n++) {
		var node = nodes[n];
		var y = node[1];
		var z = node[2];
		node[1] = y * cos_t - z * sin_t;
		node[2] = z * cos_t + y * sin_t;
	}
};


var draw = function(context) {
	//background(backgroundColour);
	var nodes, edges;

	// Draw edges
	context.strokeStyle = edgeColour;
	context.fillStyle = nodeColour;
	for (var obj = 0; obj < objects.length; obj++) {
		nodes = objects[obj].nodes;
		edges = objects[obj].edges;
		context.beginPath();
		for (var e = 0; e < edges.length; e++) {
			var n0 = edges[e][0];
			var n1 = edges[e][1];
			var node0 = nodes[n0];
			var node1 = nodes[n1];

			context.moveTo(node0[0], node0[1]);
			context.lineTo(node1[0], node1[1]);
			context.stroke();

		}
		context.closePath();
		context.fill();
	}



/*	// Draw nodes

	//noStroke();
	for (var obj = 0; obj < objects.length; obj++) {
		nodes = objects[obj].nodes;
		context.beginPath();
		for (var n = 0; n < nodes.length; n++) {
			var node = nodes[n];
			//ellipse(node[0], node[1], nodeSize, nodeSize);
		}

	}*/

};


function init() {

	var canvas = document.getElementById('mainCanvas');
	var ctx = canvas.getContext("2d");
	objects = [object1, object2, object3];

	for (var obj = 0; obj < objects.length; obj++) {
		var nodes = objects[obj].nodes;
		rotateY3D(15, nodes);
		rotateX3D(-15, nodes);
	}

	draw(ctx);
	/*
	for(var z = 0; z < source.length; z++) {
		var layer = source[z];
		for(var y = 0; y < layer.length; y++) {
			var row = layer[y];
			for(var x = 0; x < row.length; x++) {
				_3DPoints.push(new Point3D(x, y, z, row[x]));
			}
		}
	}

 */


};

function drawPoint(context, point) {
	context.fillStyle = point.color;
	context.fillRect(point.x*pointSize,point.y*pointSize,pointSize,pointSize);
}

init();