=begin
P
  - input: 3 ints
  - output: symbol
  - rules:
      - determine whether given array represents a valid triangle; if so, what kind
      - result should be represented as a symbol
      - valid triangle: 2 shortest sides add up to greater than longest side
E
D
  - starting: 3 ints
  - intermediate: array of ints
  - ending: symbol
A
  - create a sorted array of the given ints, called `sides`
  - if `sides[0]` + `sides[1]` <= `sides[2]`
      - return `:invalid`
  - if side 1 == side 2 AND side 1 == side 3
      - return :equilateral
  - if side 1 == side 2 OR side 2 == side 3 OR side 3 == side 1
      - return :isosceles
  - else, return :scalene
C
=end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort
  if sides[0] + sides[1] <= sides[2] || sides.include?(0)
    :invalid
  elsif side1 == side2 && side1 == side3
    :equilateral
  elsif side1 == side2 || side2 == side3 || side3 == side1
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid