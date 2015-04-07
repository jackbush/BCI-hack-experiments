require 'artoo'

connection :neurosky, :adaptor => :neurosky, :port => '/dev/tty.MindWave'
device :neurosky, :driver => :neurosky, :interval => 0.1

def handle_eeg(sender, data)
  puts "#{sender} | #{data}"
end

def get_eeg
  work do
    puts "SCANNING..."
    on neurosky, :eeg => :handle_eeg
  end
end

def get_attention
  work do
    puts "SCANNING..."
    on neurosky, :attention => :handle_eeg
  end
end

def get_meditation
  work do
    puts "SCANNING..."
    on neurosky, :meditation => :handle_eeg
  end
end

# THIS ALMOST WORKS -- VALUE IS NOT BEING CONVERTED/ACCEPTED
# def results_feed (selection)
#   type = selection.to_sym
#   work do
#     on neurosky, :type => :handle_eeg
#   end
# end

def menu
  puts "EEG query app"
  puts "1: return EEG value"
  puts "2: return attention value"
  puts "3: return meditation value"
  gets.chomp
end

response = menu

while response != "Q"

  case response
  when '1'
    get_eeg
    # results_feed(eeg)
  when '2'
    get_attention
    # results_feed(attention)
  when '3'
    get_meditation
    # results_feed(meditation)
  else
    menu
  end

puts 'Press enter to continue.'
gets
response = menu

end