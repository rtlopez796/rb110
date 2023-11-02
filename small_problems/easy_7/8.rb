def multiply_list(arr1, arr2)
  results = []

  arr1.each_with_index do |int, i|
    results << int * arr2[i]
  end
  results
end

# same output, but uses `Array#zip`
def multiply_list_2(arr1, arr2)
  arr1.zip(arr2).map {|arr| arr[0] * arr[1]}
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]