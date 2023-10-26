def word_sizes(string)
  split_string = string.split
  counters = Hash.new(0) # must set default value; otherwise trying to add nil + 1

  split_string.each do |word|
    counters[word.length] = counters[word.length] + 1
  end
  counters
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}