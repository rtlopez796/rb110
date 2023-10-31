def find_fibonacci_index_by_length(num_length)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    first = second
    second = fibonacci
    break if fibonacci.digits.length == num_length
  end
  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847