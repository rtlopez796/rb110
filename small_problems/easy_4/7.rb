def string_to_integer(numeric_string)
  total = 0
  index = -1

  loop do
    n = to_int(numeric_string[index])
    n = n * (10 ** ((index * -1) - 1))
    total += n
    break if (index * -1) == numeric_string.length
    index -= 1
  end
  total
end

def to_int(string_digit)
  case string_digit
  when '0' then 0
  when '1' then 1
  when '2' then 2
  when '3' then 3
  when '4' then 4
  when '5' then 5
  when '6' then 6
  when '7' then 7
  when '8' then 8
  when '9' then 9
  end
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570