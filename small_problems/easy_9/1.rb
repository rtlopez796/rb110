=begin 
P
  - input: name array >= length 2, hash
  - output: greeting string
  - rules:
      - explicit: greeting uses full name, mentions name and occupation
      - implicit: format "Hello, (full name)! Nice to have a (title occupation) around."
E
  - greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
      => "Hello, John Q Doe! Nice to have a Master Plumber around."
D
  - input: array, hash
  - output: string
A
  - create a local variable called `name` assigned to array joined with a space
  - print a string matching format with `name`, `title`, and `occupation` interpolated
C
=end

def greetings(name_arr, info_hsh)
  name = name_arr.join(' ')
  puts "Hello, #{name}! Nice to have a #{info_hsh[:title]} #{info_hsh[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })