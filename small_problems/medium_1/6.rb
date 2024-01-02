=begin
P
  - write a method that implements a mini stack-and-register based
    programming language that takes commands
  - 'stack' refers to abstract data type, could be array
  - 'register' refers to current values, value the popped value will
    interact with
  - all operations int operations
  - programs supplied to language method via string passed as argument
E
  - `n` Place a value n in the "register". Do not modify the stack.
  - `PUSH` Push the register value on to the stack. Leave the value in the register.
  - `ADD` Pops a value from the stack and adds it to the register value, storing the result in the register.
  - `SUB` Pops a value from the stack and subtracts it from the register value, storing the result in the register.
  - `MULT` Pops a value from the stack and multiplies it by the register value, storing the result in the register.
  - `DIV` Pops a value from the stack and divides it into the register value, storing the integer result in the register.
  - `MOD` Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
  - `POP` Remove the topmost item from the stack and place in register
  - `PRINT` Print the register value
D
  - array
  -integer
A
  - define a method that takes an argument called `program`
  - create an empty array called `stack`
  - create a local variable `register` set to `0`
  - split `program` into each command, called `token`
  - for each `token` in `program`...
      - `perform that operation, using the popped item from the stack
        and the register when applicable`
C
=end

def minilang(program)
  stack = []
  register = 0
  valid_tokens = ['PUSH', 'ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP', 'PRINT']
  program.split.each do |token|
    if !valid_tokens.include?(token) && token.to_i == 0
      return "'#{token}' is not a valid command"
    end
    case token
    when 'PUSH'  then stack << register
    when 'ADD'   then register += stack.pop
    when 'SUB'   then register -= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    else              register = token.to_i
    end
  end
  nil
end

minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT')
