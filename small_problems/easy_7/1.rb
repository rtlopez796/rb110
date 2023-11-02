def interleave_1(array1, array2)
  counter = 0
  merged = []

  array1.length.times do
    merged << array1[counter] << array2[counter]
    counter += 1
  end
  merged
end

def interleave_2(array1, array2)
  array1.zip(array2).flatten
end

p interleave_1([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave_2([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']