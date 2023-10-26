def digit_list(int)
  numeric_string = int.to_s
  numeric_string.chars.map {|char| char.to_i}
end

p digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true