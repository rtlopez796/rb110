=begin  
P
  - input: string
  - output: array
  - rules:
      - explicit: 
          - return array of strings of every word in input string, appended with a space and length of the word
          - word is any substring of non-space characters
          - words seperated by single space
      - implicit:
          - punctuation counts as character in word
E
D
  - starting: string
  - intermediate: int
  - ending: array of strings
A
  - split string into words and put them in an array called `words`
  - for each word in `words`
      - add a string to `result` containing the word, a space, and the length of the word
      - return array of each of these strings
C
=end

def word_lengths(str)
  words = str.split
  words.map { |word| "#{word} #{word.length}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []