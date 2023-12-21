def palindromes(str)
  substrings = substrings(str)
  substrings.select { |substring| palindrome?(substring) }
end

def palindrome?(str)
  str.length > 1 && str == str.reverse
end

def substrings(str)
  substrings = []
  str.length.times do |starting_index|
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

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
