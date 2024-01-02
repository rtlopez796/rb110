=begin
P
  - input: int(n)
  - output: display diamond
  - rules:
      - explicit:
          - display 4-pointed diamond in nxn grid
          - `n` will always be odd
      - implicit:
          - use `*`s to create diamond
          - start with 1 `*`, increment up to `n`, back to 1
E
  - n = 5
      *
     ***
    *****
     ***
      *
D
  - starting: int
  - intermediate: array of strings for each line
  - ending: n/a (print joined array w/ new line per element)
A
  - divisor = 2
  - stars = 1
  - create empty array called `lines`
  - until `stars` is equal to `n`...
      - lines << ((n / divisor) * ' ') + ("*" * stars) + ((n / divisor) * ' ')
      - increment `stars` and `divisor`
  - lines << '*' * n
  - lines << lines[0..n/2].reverse
  - print lines joined with a new line

C
=end

def diamond(n)
  middle = (n / 2)
  lines = create_lines(n, middle)
  lines << ('*' * n)
  lines << lines[0..middle - 1].reverse
  puts lines.flatten
end

def create_lines(n, middle)
  divisor = 2
  stars = 1
  lines = []
  middle.times do
    lines << ((' ' * (n / divisor)) + ('*' * stars) + (' ' * (n / divisor)))
    divisor += 1
    stars += 2
  end
  lines
end

diamond(9)
diamond(7)
diamond(5)
