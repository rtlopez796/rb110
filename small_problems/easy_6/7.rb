def halvsies(arr)
  halved = []
  mid = arr.length / 2
  if arr.length.odd?
    halved << arr[0..mid] << arr[mid+1..]
  else
    halved << arr[0...mid] << arr[mid..]
  end
  halved
end

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, -1)
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4])# == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]