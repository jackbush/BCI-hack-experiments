require 'artoo'

connection :neurosky, :adaptor => :neurosky, :port => '/dev/tty.MindWave'
device :neurosky, :driver => :neurosky, :interval => 0.1
api :host => '127.0.0.1', :port => '9000'

def handle_eeg(sender, data)
  puts "#{sender} | #{data}"
end

work do
  puts "SCANNING..."
  on neurosky, :wave => :handle_eeg
end

# attention(data)
# Event with the user's current attention level.

# blink(data)
# Event with the user's current blink level.

# meditation(data)
# Event with the user's current meditation level.

# signal_quality(data)
# Event showing signal strength.

# wave(data)
# Event showing wave data.

# eeg(data)
# Event showing EEG data.
# { :delta=>7023617, :theta=>15294464, :lo_alpha=>15209472, :hi_alpha=>13321984, :lo_beta=>4527616, :hi_beta=>12073472, :lo_gamma=>862464, :mid_gamma=>13637632 }

# start
# Gets triggered when the Mindwave is started and ready to be used.