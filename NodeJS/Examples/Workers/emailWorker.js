var EmailWorker = {};

EmailWorker.run = function () {
	process.send('Email worker is running');
};

module.exports = EmailWorker;