const cluster = require('cluster');
const http = require('http');
const numCPUs = require('os').cpus().length;

if (cluster.isMaster) {
  (function () {
    // Main App
    var worker, workers = [];

    if(numCPUs < 3) {

      console.log('Error');
    }

    // Create Import worker
    worker = cluster.fork();
    workers.push({code: 'IMP', worker: worker, name: 'Import Worker'});
    worker.on('message', messageHandler);
    worker.send({code: 'IMP', command: 'add', data: {user: 'user1', code: 123}}); // we can send object
    worker.send({code: 'IMP', command: 'add', data: {user: 'user2', code: 234}}); 
    worker.send({code: 'IMP', command: 'add', data: {user: 'user3', code: 345}}); 
    worker.send({code: 'IMP', command: 'add', data: {user: 'user4', code: 456}}); 

    // Create Email worker
    worker = cluster.fork();
    workers.push({code: 'EML', worker: worker, name: 'Email Worker'});
    worker.on('message', messageHandler);
    worker.send({code: 'EML', command: 'run'});

    function messageHandler(msg) {
      if (msg) {
        console.log('Master', msg);
      }
    }

    // Run server
    http.Server((req, res) => {
      if(req.url == '/'){
        res.writeHead(200);
        res.end('hello world\n');
        workers[0].worker.send({code: 'IMP', command: 'add', data: {user: 'user4', code: 567}});
      }
    }).listen(8000);

  })();
  

} else {
  (function () {
    const importWorker = require('./importWorker');
    const emailWorker = require('./emailWorker');

    var w;
    // Workers (in this case - one worker)
    console.log('worker', process.pid);
    
    process.on('message', (msg) => {
      console.log('Worker', msg);
      switch(msg.code) {
        case 'IMP':
          importWorker.add(msg.data);
          break;
        case 'EML':
          emailWorker.run();
          break;  
      }
    });

  })();
  
}