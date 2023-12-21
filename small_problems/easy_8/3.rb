def substrings(str)
  substrings = []
  (str.length).times do |starting_index|
    substrings << leading_substrings(str[starting_index..])
  end
  substrings.flatten
end

def leading_substrings(str)
  substrings = []
  current_substring = ''
  str.each_char do |char|
    current_substring += char
    substrings << current_substring
  end
  substrings
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]