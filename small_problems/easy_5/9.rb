def crunch(string)
  crunched = ''
  last_character = ''

  string.each_char do |char|
    crunched << char if char != last_character
    last_character = char
  end
  crunched
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''