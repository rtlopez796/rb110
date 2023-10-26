def swap(string)
  split_string = string.split
  split_string.each do |word|
    word[0], word[-1] = word[-1], word[0]
  end
  split_string.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'