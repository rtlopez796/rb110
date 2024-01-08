=begin
P
  - input: string
  - ouput: bool
  - rules:
      - return true if all paratheses in string are balanced, false otherwise
E
D
A
  - count number of '(' and ')'
  - return false if unequal
  - if equal...
      - create a variable called `balanced` assigned to `0`
      - for each character in string
          - if '(', increment `balanced`
          - if ')', decrement `balanced`
          - if `balanced` is ever negative, return false
      - if `balanced` != 0, return false
      - else, return true
C
=end

def balanced?(str)
  return false if str.count('(') != str.count(')')
  balanced = 0
  str.chars do |char|
    balanced += 1 if char == '('
    balanced -= 1 if char == ')'
    return false if balanced < 0
  end
  balanced == 0
end 

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false