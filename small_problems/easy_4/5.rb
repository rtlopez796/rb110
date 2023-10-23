def multisum(int)
  muliples = []
  (1..int).each do |number|
    muliples << number if number % 3 == 0 || number % 5 == 0
  end
  muliples.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168