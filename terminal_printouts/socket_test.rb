require 'socket'

hostname = 127.0.0.1
port = 13854

s = TCPSocket.open(hostname, port)

while line = s.gets
  puts line.chop
end
s.close