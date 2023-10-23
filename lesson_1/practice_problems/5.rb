# Find the index of the first name that starts with "Be".

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

be_index = flintstones.index {|name| name[0..1] == 'Be'}
p be_index