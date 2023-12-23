=begin  
P
  - input: array of words
  - output: prints arrays of words that are anagrams
  - rules:
      - explicit:
          - anagrams are words w/ same letters in different order
      - implicit:
          - all letters lowercase
          - each anagram array should print on new line
E
  - ["demo", "dome", "mode"]
    ["neon", "none"]
    #(etc)
D
  - starting: array
  - intermediate:
  - ending: new array, printed
A
  - creat a copy of the input array called `words_copy`
  - until `words_copy` is empty...
      - create an empty array called `anagrams`
      - remove the first word from `words_copy` assign it to `current_word`
      - for each word in `words_copy`...
          - compare to `current_word`
          - if anagrams, add word to `anagrams` and remove from `words_copy`
      - print `anagrams`
  - determine anagrams
      - split both words into their characters as an array
      - sort those arrays, compare
      - if equal, return true
C
=end

def group_anagrams(words)
  words_copy = words.dup
  until words_copy.empty?
    current_word = words_copy[0]
    anagrams = words_copy.select { |word| anagrams?(current_word, word) }
    words_copy.delete_if { |word| anagrams.include?(word) }
    p anagrams
  end
end

def anagrams?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
         'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
         'flow', 'neon']

group_anagrams(words)
