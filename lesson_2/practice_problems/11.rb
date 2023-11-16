arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

selected = arr.map do |num_arr|
  num_arr.select {|num| num % 3 == 0}
end

p selected