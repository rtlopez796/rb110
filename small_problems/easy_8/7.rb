def double_consonants(str)
  results = ''
  str.each_char do |char|
    results << if char.match?(/[a-zA-Z]/) && char.match?(/[^aeiouAEIOU]/)
                 char * 2
               else
                 char
               end
  end
  results
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""