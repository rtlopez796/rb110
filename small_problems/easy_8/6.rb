def repeater(str)
  results = ''
  str.each_char do |char|
    results << (char * 2)
  end
  results
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''