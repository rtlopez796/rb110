def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + ordinal_indicator(century)
end

def ordinal_indicator(century_number)
  last_digit = century_number % 10
  last_two_digits = century_number % 100

  return 'th' if [11, 12, 13].include?(last_two_digits)

  case last_digit
  when 1
    'st'
  when 2
    'nd'
  when 3
    'rd'
  else
    'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'