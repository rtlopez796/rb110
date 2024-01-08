=begin
P
  - input: word (string)
  - output: bool
  - rules:
      - explicit:
          - return false if the word contains both letters from any of provided blocks, falso otherwise
          - each letter can only be used once
      - implicit:
          - not case sensitive
E
D
  - staring: string
  - intermediate:
      - nested array to store blocks
      - array of characters in each word
  - ending: bool
A
  - create an array called `blocks` with each block saved as an array of strings
  - save the capitalized characters in each word to an array called `chars`
  - for each array in `blocks`
      - if `chars` contains both letters in `blocks` return false
  - for each character in `chars`
      - if character occurs more than once, return false
  - otherwise, return true
C
=end

BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], 
          ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
          ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

def block_word?(word)
  chars = word.upcase.each_char
  BLOCKS.each do |block|
    if chars.include?(block[0]) && chars.include?(block[1])
      return false
    end
  end
  chars.each do |char|
    return false if chars.count(char) > 1
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true