=begin  
P
  - input: array
  - output: new array
  - rules:
      - return array containing element at odd placement (not index) of input array
E
D
  - starting: array
  - intermediate:
  - ending:  new array
A
  - select elements at even indices
C
=end

def oddities(arr)
  arr.select { |elem| arr.index(elem).even? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]