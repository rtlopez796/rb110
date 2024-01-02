=begin
P
  - input: int
  - output: int
  - rules:
      - calculte nth fibonacci number recusively
      - recursive:
          - calls itself
          - condition to stop recursion
          - use result returned by self
E
D
  - int
A
  - return 1 if n == 1 or 2
  - otherwise
      - fib(n-1) + fib(n -2)
C
=end

def recursive_fib(n)
  return 1 if n <= 2
  recursive_fib(n - 1) + recursive_fib(n - 2)
end

p recursive_fib(1) == 1
p recursive_fib(2) == 1
p recursive_fib(3) == 2
p recursive_fib(4) == 3
p recursive_fib(5) == 5
p recursive_fib(12) == 144
p recursive_fib(20) == 6765
