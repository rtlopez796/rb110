def triangle(ang1, ang2, ang3)
  angles = [ang1, ang2, ang3]
  if angles.sum != 180 || angles.include?(0)
    :invalid
  elsif angles.count(90) == 1
    :right
  elsif angles.count { |ang| ang > 90 } == 1
    :obtuse
  else
    :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid