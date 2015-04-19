# Neurosky Data Forwarder

Node.js server using websockets to forward data from a Neurosky EEG to be accessed by web apps such as [Mindflow](http://mindflow.jackbush.co/#!/).
 
## To Run

Successfully running this requires that you have [Node.js](https://nodejs.org/) and Neurosky's [ThinkGear Connector](http://developer.neurosky.com/docs/doku.php?id=thinkgear_connector_tgc) installed.

```
$ git clone <repo>
$ cd %s
$ npm install
$ node server.js
=> served on localhost:9876
```

## Debugging

If you have a port conflift, it can fixed by trying another value at `server.js:6`.

## What you get

Once running, navigating to (http://localhost:9876/index.html)[http://localhost:9876/index.html] will load a simple page. Opening the browser console will show the EEG data being served.

The socket emits by default `test` and `eeg` objects. `test` emits `{foo : "bar"}` every 500ms; `eeg` emits a new EEG dataset every time the headset returns one.

## Integration

The following code will connect your app to the socket on the client's computer and log the data to their browser console. It can then be treated as any other socket.

```
var eegSocket = io.connect('http://localhost:9876');
eegSocket.on('eeg', function(data) {
  console.log(data);
});
```

## Terminal Printouts

Fron an earlier stage of this project, the Terminal Printouts folder contains Ruby scripts connecting to Neurosky's Thinkgear Connector and printing various parts of the output data to the terminal as a stream of JSON objects.

## Context

A component of my final project on Web Development Immersive course at General Assembly. A functional website interacting with this server can be found [here](http://mindflow.jackbush.co/#!/).