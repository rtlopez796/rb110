=begin
P
  - input: string
  - output: same string
  - rules:
      - convert digit words to digit
      -digits, not full number
E
  - five one two three => 5 1 2 3
D
  - starting: string
  - intermediate: array of digit words, array of words in input string
  - ending: modified string
A
  - define a constant array called `digits` of the strings [ 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  - split the input string into individual words, saved to array called `words`
  - for each word in string...
      - if it is in `digits`...
          - replace that word in `words` with corresponding digits using index of `digits` array
  - replace input string with joined `words`
C
=end

DIGITS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
DIGITS_HSH = { 'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9' }

def word_to_digit(str)
  words = str.split
  words.each_with_index do |word, i|
    if DIGITS.include?(word)
      words[i] = DIGITS.index(word).to_s
    elsif DIGITS.include?(word[0..-2])
      words[i] = DIGITS.index(word[0..-2]).to_s + word[-1]
    end
  end
  str.replace(words.join(' '))
end

def word_to_digit2(str)
  DIGITS_HSH.keys.each do |word|
    str.gsub!(/\b#{word}\b/, DIGITS_HSH[word])
  end
  str
end

str = 'Please call me at five five five one two three four. Thanks.'
word_to_digit(str)
p str
