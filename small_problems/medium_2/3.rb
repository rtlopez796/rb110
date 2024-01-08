=begin
P
  - input: string
  - output: hash
  - rules:
      - count number of uppercase, lowercase, and neither characters
      - return the percentage of each in a hash
E
D
  - starting: string
  - intermediate:
      - array of characters in input string
      - ints representing lowercase, uppercase, neither, and total characters
  - ending: hash
A
  - create a variable called `total` set to length of string
  - create variables lowercase, uppercase, and neither set to `0`
  - for each character in string
      - determine category
      - increase count of that category
  - return a hash w/ keys lowercase, uppercase, and neither, where the values are the corresponding totals
    divided by the sum as floats w/ 1 decimal
C
=end

def letter_percentages(str)
  total = str.length.to_f
  lower, upper, none = 0.0, 0.0, 0.0
  str.chars.each do |char|
    if char.match?(/[A-Z]/)
      upper += 1
    elsif char.match?(/[a-z]/)
      lower += 1
    else
      none += 1
    end
  end
  { lowercase: calculate_percentage(lower, total), uppercase: calculate_percentage(upper, total), neither: calculate_percentage(none, total)}
end

def calculate_percentage(num, total)
  ((num / total) * 100).round(1)
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }