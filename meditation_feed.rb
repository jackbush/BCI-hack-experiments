require 'artoo'

connection :neurosky, :adaptor => :neurosky, :port => '/dev/tty.MindWave'
device :neurosky, :driver => :neurosky, :interval => 0.1

def handle_eeg(sender, data)
  puts data
end

work do
  puts "SCANNING MEDITATION..."
  on neurosky, :meditation => :handle_eeg
end