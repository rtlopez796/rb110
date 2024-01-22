def merge(arr1, arr2)
  result = []
  index2 = 0

  arr1.each do |value|
    while index2 < arr2.length && arr2[index2] <= value
      result << arr2[index2]
      index2 += 1
    end
    result << value
  end
  result.concat(arr2[index2..-1])
end

arr1 = [1, 5, 9]
arr2 = [2, 6, 8]
p merge(arr1, arr2) #== [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
p merge([2], [3])