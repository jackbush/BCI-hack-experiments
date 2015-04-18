var neurosky = require('node-neurosky');
var server = require('http').createServer();

var client = neurosky.createClient({
  appName:'NodeNeuroSky',
  appKey:'0fc4141b4b45c675cc8d3a765b8d71c5bde9390'
});

client.connect();

var io = require('socket.io')(server);

io.on('connect', function(socket){
  client.on('data',function(data) {
    socket.emit('eeg', data);
  });
  // socket.on('event', function(data){});
  // socket.on('disconnect', function(){});
});

server.listen(9876);