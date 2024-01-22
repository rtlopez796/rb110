def merge_sort(arr)
  return arr if arr.length == 1
  mid = arr.length / 2
  left = arr[0...mid]
  right = arr[mid..]

  left = merge_sort(left)
  right = merge_sort(right)

  merge(left, right)
end

def merge(arr1, arr2)
  result = []
  counter2 = 0
  arr1.each do |value|
    while counter2 < arr2.length && arr2[counter2] <= value
      result << arr2[counter2]
      counter2 += 1
    end
    result << value
  end
  result.concat(arr2[counter2..-1])
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]