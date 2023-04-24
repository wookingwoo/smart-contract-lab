var http = require('http');
var url = require('url');
var fs = require('fs');

http.createServer(function (req, res) {
	res.writeHead(200, {'Content-Type': 'text/plain'});
	var a = req.url;
	console.log(a)
	fs.readFile("." + a, function(err, data) {
		res.writeHead(200, {'Content-Type': 'text/html'});
		res.write(data);
		res.end();
	});

}).listen(8080);

