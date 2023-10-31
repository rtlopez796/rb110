# What will the following code print, and why? Don't run 
# the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
p array1, array2

=begin
This code will print the original array with all the names
starting with "C" or "S" uppercased.
This is because array2 has been populated with the same
objects as array1. If an element in array1 is mutated,
you'll see the change in array2 as well.
=end