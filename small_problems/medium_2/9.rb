=begin
P
  - input: array
  - output: sorted array (mutated)
  - rules:
      - write a bubble sort algorithm
E
D
A
  - create local variables `first` and `second` assigned to `0` and `1`
  - until no swaps occur
      - until `second` is length of array
        - if array[first] > array[second]
            - swap elements
            - increment `swaps`
        - increment `first` and `second`
C
=end

def bubble_sort!(arr)
  loop do
    first, second = 0, 1
    swapped = false
    until second == arr.length
      if arr[first] > arr[second]
        arr[first], arr[second] = arr[second], arr[first]
        swapped = true
      end
      first += 1
      second += 1
    end
    break unless swapped
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)