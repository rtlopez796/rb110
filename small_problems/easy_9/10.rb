=begin  
P
  - input: positive int
  - output: int
  - rules: method takes int, returns sum of its digits as int
E
D
  - starting: int
  - intermediate: array of digits
  - ending: int
A
  - split the input int into its digits
  - add the digits, return result
C
=end

def sum(num)
  num.digits.reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45