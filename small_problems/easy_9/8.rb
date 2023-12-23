=begin  
P
  - input: array of sub arrays
  - output: new array, flat
  - rules:
      - explicit:
          - output array should contain each grocery item from input array
          - items should occur in output array # of times provided as int in sub array from input
      - implicit:
          - output array should be flat
E
D
  - starting: array of sub arrays
  - intermediate: strings, ints
  - ending: array of strings
A
  - create an empty array called `results`
  - for each element in input array...
      - add array[0] to `results` array[1] times
  - return results
C
=end

def buy_fruit(fruits)
  results = []
  fruits.each do |fruit|
    fruit[1].times { |_| results << fruit[0] }
  end
  results
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]