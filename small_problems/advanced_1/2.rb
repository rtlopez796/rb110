=begin
P
  - input: int
  - output: print star
  - rules:
      - explicit:
          - display an 8-pointed star given an odd int
          - smallest will be 7x7
      - implicit:
          - top and bottom row of star will have (int-1)/2 spaces inbetween each `*`
          - each row has 3 `*` except for middle
E
  - star(7)
     *  *  *
      * * *
       ***
     *******
       ***
      * * *
     *  *  *
D
  - starting: int (n)
  - intermediate: strings, arrays, ints
  - ending: printed strings
A
  - create an empty array called `lines`
  - create a string called `middle` that is `n` number of `*`s
  - push `middle` to `lines`
  - create a local variable called `spaces` set to `0`
  - (n-1)/2 times...
      - prepend and append a string of 3 `*`s, with `spaces` number of spaces inbetween each
      - increment `spaces`
  - print each line in `lines`
C
=end

def star(grid_size)
  middle = "*" * grid_size
  lines = [middle]
  spaces = 0
  ((grid_size - 1) / 2).times do
    line = "*" + (' ' * spaces) + "*" + (' ' * spaces) + "*"
    lines.prepend(line)
    lines.append(line)
    spaces += 1
  end
  lines.each { |line| puts line.center(grid_size) }
end

star(7)
star(9)