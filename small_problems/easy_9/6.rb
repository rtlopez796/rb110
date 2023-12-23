=begin  
P
  - input: 2 ints
  - output: array of ints
  - rules:
      - explicit:
          - return array of length of 1st int
          - elements should be multiples of 2nd int
          - starting # can be any int, length will be > 0
E
D
  - starting: ints
  - ending: array
A
  - create a local variable called `counter` set to `1`
  - 1st int times,
      - multiply 2nd int by `counter`` and add result to an array
      - increase `counter`
  - return result array
C
=end

def sequence(length, start)
  counter = 1
  result = []
  length.times do
    result << start * counter
    counter += 1
  end
  result
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []