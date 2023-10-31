def my_include?(array, search)
  array.each do |element|
    return true if element == search
  end
  return false
end

p my_include?([1,2,3,4,5], 3) == true
p my_include?([1,2,3,4,5], 6) == false
p my_include?([], 3) == false
p my_include?([nil], nil) == true
p my_include?([], nil) == false