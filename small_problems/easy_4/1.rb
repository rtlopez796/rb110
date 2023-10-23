def short_long_short(str_1, str_2)
  short = ''
  long = ''

  if str_1.length < str_2.length
    short = str_1
    long = str_2
  else
    short = str_2
    long = str_1
  end

  short + long + short
end

# ls solution
# def short_long_short(string1, string2)
#   if string1.length > string2.length
#     string2 + string1 + string2
#   else
#     string1 + string2 + string1
#   end
# end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"