=begin
P
  - input: int
  - output: max rotated int
  - rules:
      - explicit:
          - rotate int to the left, then fix 1st digit, rotate, fix 1st and 2nd digit, rotate, etc.
          - can use `rotate_rightmost_digits` from prior problem
          - don't have to handle multiple zeroes
      -implicit:
          - leading zeroes dropped
E
D
  - starting: int
  - intermediate: array of digits
  - ending: int
A
  - create local variable `n` assigned to # of digits in int
  - until `n` is 0...
      - reassign `num` to return int of `rotate_rightmost_digits(num, n)`
      - decrement `n`
  - return `num`
C
=end

def max_rotation(num)
  n = num.to_s.length
  until n == 0
    num = rotate_rightmost_digits(num, n)
    n -= 1
  end
  num
end

def rotate_rightmost_digits(num, n)
  digits = num.digits.reverse
  digits << rotate_array(digits.pop(n))
  digits.join.to_i
end

def rotate_array(arr)
  arr[1..] << arr[0]
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
