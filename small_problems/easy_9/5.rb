=begin  
P
  - input: string
  - output: new string
  - rules:
      - explicit:
          - input will be format first name + space + last name
          - output must be format last name + comma + space + first name
      - implicit
          - method should be non-mutating
E
  - swap_name('Joe Roberts') == 'Roberts, Joe'
D
  - starting: string
  - intermidate: array
  - ending: new string
A
  - create an array of words in input string
  - return a string in the correct output format using the array
C
=end

def swap_name(name)
  names = name.split
  "#{names.pop}, #{names.join(' ')}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'