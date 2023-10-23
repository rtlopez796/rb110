DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  current_number = number
  result = ''
  loop do
    result.prepend(DIGITS[current_number % 10])
    current_number /= 10
    break if current_number == 0
  end
  result
end

def signed_integer_to_string(number)
  stringed_number = integer_to_string(number.abs)
  if number == 0
    stringed_number = '0'
  elsif number > 0
    stringed_number.prepend('+')
  else
    stringed_number.prepend('-')
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'