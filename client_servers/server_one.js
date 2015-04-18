// var http = require('http');
// var io = require('socket.io');
var neurosky = require('node-neurosky');

var server = require('http').createServer();
var io = require('socket.io')(server);
io.on('connection', function(socket){
  socket.on('event', function(data){});
  socket.on('disconnect', function(){});
});
server.listen(9876);

// EEG connection
try {
  // initialize
  var client = neurosky.createClient({
    appName:'NodeNeuroSky',
    appKey:'0fc4141b4b45c675cc8d3a765b8d71c5bde9390'
  });
  // connect
  client.connect();
  var io = server.get('socketio');
  // emit
  io.on('connect', function(socket) {
    client.on('data',function(data) {
      socket.emit('eeg', data);
    });
  });
} catch(e) {
  console.log(e);
}
