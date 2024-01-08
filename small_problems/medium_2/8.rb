=begin
P
  - A featured number (something unique to this exercise) is an odd number that is a multiple
    of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number,
    but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the
    digit 3 appears twice).
  - input: int
  - output: int
  - rules:
      - explicit:
          - find next int that is odd, a multiple of 7, and doesn't have any repeating digits
      - implicit:
          - numbers will be ints, not floats
E
D
  - starting: int
  - intermediate: array of digits in it
  - ending: int
A
  - print error message if `num` has more than 10 digits
  - check if `num` is a featured number
      - `num` is odd
      - `num` is divisible by 7
      - `num` doesn't have repeated digits
          - break `num` into its digits saved to array `digits`
          - for each digit in `digits`
              - does digit occur more than once
  - increment `num`
  - check again
C
=end

def featured(num)
  num += 1
  num += 1 until num.odd? && num % 7 == 0
  loop do
    break if num >= 9_999_999_999
    return num if num.digits.uniq == num.digits
    num += 14
  end
  puts 'There is no possible number that fulfills those requirements'
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements