=begin  
P
  - input: int
  - output: new int
  - rules:
      - explicit:
          - return input int * 2 unless input is a double number
          - double numbers have even # of digits, and left is same as right side
      - implicit: input will always be single int
E
  - double nums: 44, 3333, 103103
D
  - starting: int
  - intermediate: array of digits in input int
  - ending: int
A
  - return int if less than 10
  - split the input int into its digits and save to an array called `digits`
  - find the midpoint of `digits` and assign it to `mid`
  - if `digits` is an even length and is the first half is the same as the last half
      - return input int
  - else, return int * 2
C
=end

def twice(num)
  return num * 2 if num < 10
  digits = num.digits
  mid = digits.length / 2
  if digits.length.even? && digits[0...mid] == digits[mid..]
      return num
  else
      return num * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10