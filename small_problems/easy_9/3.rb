=begin  
P
  - input: int
  - output: array of ints
  - rules:
      - return array of ints from 1 to argument int, inclusive
      - int will be > 0
E
  - 3 => [1, 2, 3]
D
  - starting: int
  - intermediate: n/a
  - ending: array
A
  - create and return an array from 1 to int, inclusive
C
=end

def sequence(num)
  (1..num).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]