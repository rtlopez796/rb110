words = "the flintstones rock"

# def titleize(phrase)
#   arr = phrase.chars
#   arr[0].capitalize!
#   arr.each_with_index do |char, index|
#     if char == ' '
#       arr[index +1].capitalize!
#     end
#   end
#   arr.join
# end

def titleize(phrase)
  phrase.split.map {|word| word.capitalize!}.join(' ')
end

p titleize(words)