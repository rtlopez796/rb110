arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

sorted = arr.sort_by do |num_arr|
  num_arr.select {|num| num.odd?}
end



p sorted