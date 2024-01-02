def fibonacci(n)
  fib = [1, 1]
  loop do
    break if fib.length >= n
    fib << (fib[-1] + fib[-2])
  end
  fib[-1]
end

def procedural_fib(n)
  first, last = [1, 1]
  3.upto(n) do
    first, last = [last, first + last]
  end
  last
end

p procedural_fib(100001)
