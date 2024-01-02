=begin
P
  - input: 2 ints
  - output: int
  - rules:
      - explicit:
          - rotate last `n` digits of number
          - can use `rotate_array` from prior problem
          - `n` is always positive
      - implicit:
          - number will be type int
          - `n` = 1 should return input int

E
D
  - starting: 2 ints
  - intermediate: array of int's digits
  - ending: int
A
  - split number into digits, saved to array `digits`
  - call `rotate_array` on the index `-n`
      - reassign last n digits of `digits` to return value
  - convert `digits` back to an int, return
C
=end

def rotate_rightmost_digits(num, n)
  digits = num.digits.reverse
  digits << rotate_array(digits.pop(n))
  digits.join.to_i
end

def rotate_array(arr)
  arr[1..] << arr[0]
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
