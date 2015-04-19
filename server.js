var neurosky = require('node-neurosky');
var app = require('http').createServer(router);
var io = require('socket.io')(app);
var fs = require('fs');

app.listen(9876);

function router (req, res) {
  fs.readFile(__dirname + '/index.html',
  function (err, data) {
    if (err) {
      res.writeHead(500);
      return res.end(err);
    }
    res.writeHead(200);
    res.end(data);
  });
}

var client = neurosky.createClient({
  appName:'NodeNeuroSky',
  appKey:'0fc4141b4b45c675cc8d3a765b8d71c5bde9390'
});

client.connect();

io.on('connection', function (socket) {
  setInterval(function() { 
    socket.emit('test', {foo: 'bar'});
  }, 500);
  client.on('data',function(data) {
    socket.emit('eeg', data);
  });
});
