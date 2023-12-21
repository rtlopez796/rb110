def reverse_words(str)
  words = str.split
  words.each do |word|
    word.reverse! if word.length >= 5
  end
  words.join(' ')
end

puts reverse_words('Professional')          == 'lanoisseforP'
puts reverse_words('Walk around the block') == 'Walk dnuora the kcolb'
puts reverse_words('Launch School')         == 'hcnuaL loohcS'