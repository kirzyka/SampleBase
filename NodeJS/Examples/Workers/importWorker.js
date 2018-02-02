var ImportWorker = {};
var queue = [];
var isRuning = false;
var isBusy = false;
var timer;

function run() {
	if(!isRuning) {
		isRuning = true;
		process.send('Import worker is running');
		timer = setInterval(() => {
			if(!isBusy && queue.length) {
				isBusy = true;
				handle(queue.shift());
			}
		}, 10000);
	}
}

function stop() {
	clearInterval(timer);
	process.send('Import worker was stopped');
}

function handle(data) {
	var r = 0;
	console.log(data);
	for(var i = 0; i < 1000000; i++) {
		r++;
	}
	isBusy = false;
	if(!queue.length) { 
		stop(); 
		isRuning = false;
	}
}


ImportWorker.add = (data) => {
	queue.push(data);
	run();
};

module.exports = ImportWorker;