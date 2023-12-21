def fizzbuzz(starting_num, ending_num)
  arr = (starting_num..ending_num).to_a
  arr.each_with_index do |num, i|
    arr[i] = fizzbuzz_value(num)
  end
  puts arr.join(', ')
end

def fizzbuzz_value(num)
  case
  when num % 3 == 0 && num % 5 == 0
    'FizzBuzz'
  when num % 3 == 0
    'Fizz'
  when num % 5 == 0
    'Buzz'
  else
    num
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz