# DOCUMENTATION http://artoo.io/documentation/platforms/neurosky/

require 'artoo'

connection :neurosky, :adaptor => :neurosky, :port => '/dev/tty.MindWave'
device :neurosky, :driver => :neurosky, :interval => 0.1
api :host => '127.0.0.1', :port => '9000'

def handle_eeg(sender, data)
  puts data
end

work do
  puts "SCANNING EEG..."
  on neurosky, :eeg => :handle_eeg
end
