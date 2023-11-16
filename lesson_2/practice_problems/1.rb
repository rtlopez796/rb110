arr = ['10', '11', '9', '7', '8']

sorted = arr.sort_by {|num| num.to_i}.reverse

sorted_2 = arr.sort {|a, b| b.to_i <=> a.to_i}

p sorted, sorted_2