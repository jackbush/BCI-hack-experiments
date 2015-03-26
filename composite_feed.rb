require 'artoo'

connection :neurosky, :adaptor => :neurosky, :port => '/dev/tty.MindWave'
device :neurosky, :driver => :neurosky, :interval => 0.1
api :host => '127.0.0.1', :port => '9000'

def handle_eeg(sender, data)
  name = sender.split('_').last[0..2]
  puts "#{name} | #{data}"
end

work do
  puts "SCANNING..."
  on neurosky, :eeg => :handle_eeg, :attention => :handle_eeg, :meditation => :handle_eeg
end