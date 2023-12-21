def leading_substrings(str)
  substrings = []
  current_substring = ''
  str.each_char do |char|
    current_substring += char
    substrings << current_substring
  end
  substrings
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']