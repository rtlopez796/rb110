def my_reverse(arr)
  reversed = []

  return reversed if arr.length == 0

  arr.reverse_each do |element|
    reversed << element
  end
  reversed
end

p my_reverse([1,2,3,4]) == [4,3,2,1]          # => true
p my_reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p my_reverse(['abc']) == ['abc']              # => true
p my_reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = my_reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true