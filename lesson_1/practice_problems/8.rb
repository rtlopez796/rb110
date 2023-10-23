# What happens when we modify an array while we are iterating over it? 
# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

p numbers

# This will output `1` and `3` and `numbers` will point to `[3,4]`. This is 
# because we are modifying the array as we iterate over it. The first iteration,
# `number` is pointing to `numbers[0]`, which is `1`. `shift` then deletes `1`.
# On the next iteration, `number` is pointing to `numbers[1]`, which is now `3`,
# so `3` is printed. The first element is again deleted, which is now `2`.

# What would be output by this code?

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

# This code will do the same thing, but from right to left.