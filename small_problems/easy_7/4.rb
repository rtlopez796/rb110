def swapcase(str)
  result = ''

  str.each_char do |char|
    if char.match?(/[A-Z]/)
      result << char.downcase
    else
      result << char.upcase
    end
  end
  result
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'