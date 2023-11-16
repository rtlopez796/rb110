arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted = arr.map do |arr1|
  arr1.sort {|a, b| b <=> a}
end

p sorted