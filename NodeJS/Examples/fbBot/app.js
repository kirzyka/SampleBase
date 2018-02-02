var http = require('http');
var https= require('https');

var DOMAIN = 'facebook.com';

process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";




goToURL('http://' + DOMAIN + '/kirzyka/friends')
	.then(function(data) {
		processResponse(data);
	}, function (e) {
		console.log('Error', e);
	});
	


function goToURL(url) {
	var checkResponseFn = function(res) {

		var promise = new Promise(function(resolve, reject) {
			if(res.statusCode == 301 || res.statusCode == 302) {
				console.log('Redirect to ', res.headers.location);
				goToURL(res.headers.location)
					.then(function(data) {
						resolve(data);
					}, function (e) {
						reject(e);
					});
			} else {
				resolve(res);
			}
		});
		return promise;
	};


	var promise = new Promise(function(resolve, reject) {
		var urlObj = parseURL(url);

		if(urlObj.protocol == 'https://') {
			console.log('Get* - ', urlObj.protocol, urlObj.host, urlObj.path);
			getHTTPS(urlObj)
				.then(function(data) {
					checkResponseFn(data)
						.then(function(data) {
							resolve(data);
						}, function (e) {							
							reject(e);
						});
				}, function (e) {
					console.log("Got error: " + e.message);
					reject(e);
				});
		} else {
			console.log('Get - ', urlObj.protocol, urlObj.host, urlObj.path);
			getHTTP(urlObj)
				.then(function(data) {					
					checkResponseFn(data)
						.then(function(data) {
							resolve(data);
						}, function (e) {							
							reject(e);
						});
				}, function (e) {
					console.log("Got error: " + e.message);
					reject(e);
				});
		}
	});

	return promise;
}

function processResponse(res) {
	var promise = new Promise(function(resolve, reject) {
		console.log('Response');
		readBody(res)
			.then(function(data) {
				//console.log('Body', data);
				console.log('Read URLs');
				console.log('URLs', getURLS(data));
				resolve(data);
			}, function (e) {
				reject(e);
			});
		});
	return promise;
}

function getHTTP(urlObj) {
	var promise = new Promise(function(resolve, reject) {
			var options = {
			  host: urlObj.host,
			  port: 80,
			  path: urlObj.path,
			  headers: {
			  	'Cache-Control':'no-cache',
			  	'user-agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36'
			  }
			};
			//console.log(options);
			http.get(options, function(res) {
				console.log('statusCode:', res.statusCode);
				console.log('headers:', res.headers);
				resolve(res);
			}).on('error', function(e) {
				reject(e);
			});

		});
	return promise;
}

function getHTTPS(urlObj) {
	var promise = new Promise(function(resolve, reject) {	
			var options = {
			  host: urlObj.host,
			  port: 443,
			  path: urlObj.path,
			  headers: {
			  	'Cache-Control':'no-cache',
			  	'user-agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36'
			  }
			};
			//console.log(options);
			https.get(options, function(res) {
				console.log('statusCode:', res.statusCode);
				console.log('headers:', res.headers);
				resolve(res);
			}).on('error', function(e) {
				reject(e);
			});
		});
	return promise;	
}

function parseURL(url) {
	var result = {},
		patternProtocol = /^(http(s)?(:\/\/))?/i,
		patternHost = /([a-zA-Z0-9-_\.]+)/;

	result.protocol =  patternProtocol.exec(url)[0];	
	url = url.replace(result.protocol, '');
	result.host = patternHost.exec(url)[0];	
	url = url.replace(result.host, ''); 
	result.path = url;

	return result;
}

function readBody(res) {
	var promise = new Promise(function(resolve, reject) {
		var body = [];

//		res.setEncoding('utf8');
		res.on('data', function (chunk) {
	    	body.push(chunk);
	  	}).on('end', () => {
			body = Buffer.concat(body).toString();
		  	// at this point, `body` has the entire request body stored in it as a string
	  		resolve(body);
		});
	});
	return promise;
}

function getURLS(body) {	
	var result = {},
		pattern = /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/gim,
		m;

	do {
	    m = pattern.exec(body);
	    if(m && m[0].indexOf(DOMAIN) > -1) {
	        result[m[0]] = true;
	    }
	} while (m);

	return result;
}