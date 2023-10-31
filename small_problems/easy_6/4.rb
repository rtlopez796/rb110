def my_reverse!(arr)
  return arr if arr.length <= 1

  left_index = 0
  right_index = -1

  (arr.length/2).times do
    arr[left_index], arr[right_index] = arr[right_index], arr[left_index]
    left_index += 1
    right_index -= 1
  end
  arr
end

p list = [1,2,3,4]
p result = my_reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
p my_reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p my_reverse!(list) == ["abc"] # true
p list == ["abc"] # true

p list = []
p my_reverse!(list) == [] # true
p list == [] # true