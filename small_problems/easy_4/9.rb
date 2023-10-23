DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(integer)
  current_number = integer
  result = ''
  loop do
    result.prepend(DIGITS[current_number % 10])
    current_number /= 10
    break if current_number == 0
  end
  result
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'