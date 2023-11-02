def show_multiplicative_average(int_array)
  product = 1
  int_array.each {|int| product *= int}
  result = product.to_f / int_array.length
  puts "The result is %.3f" % result
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667