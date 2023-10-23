# Create a hash that expresses the frequency with which each letter occurs in this string.

statement = "The Flintstones Rock"
char_count = {}

statement.each_char do |char|
  if char == ' '
    next
  elsif char_count.has_key?(char)
    char_count[char] += 1
  else
    char_count[char] = 1
  end
end

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end

p result == char_count