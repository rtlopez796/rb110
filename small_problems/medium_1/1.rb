=begin
P
  - input: array
  - output: new array
  - rules:
      - move first element of array to end of array
      - input array cannot be modified
      - cannot use existing rotate methods
E
D
  - starting: array
  - intermediate:
  - ending: new array
A
  - create an array starting with 2nd element of input array to end
  - add first element of input array to end
C
=end

def rotate_array(arr)
  arr[1..] << arr[0]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
