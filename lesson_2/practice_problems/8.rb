hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, v|
  v.each do |str|
    str.chars.each do |char|
      puts char if char.match?(/[aeiouAEIOU]/)
    end
  end
end
