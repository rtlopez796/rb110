=begin
P
  - input: txt file
  - output: string (longerst sentence + number of words)
  - rules:
      - sentences seperated by `.` `!` or `?`
      - words seperated by ` `
E
D
  - starting: txt file
  - intermediate: arrays of words, sentences
  - ending: printed string
A
  - open the txt file and save it to local variable `file`
  - split the file into sentence using `.` `?` and `!`
      - 
  - split each sentence into words
  - determine which words array is the longest
  - print longest array joined as a sentence, along with length of array
C
=end

def longest_sentence(txt_file)
  text = File.read(txt_file)
  sentences = text.split(/(\.|\?|\!)/)#.each_slice(2).map(&:join)
  p sentences
  longest_sentence = sentences[0]
  sentences.each do |sentence|
    if sentence.length > longest_sentence.length
      longest_sentence = sentence
    end
  end
  longest_sentence.strip!
  puts "#{longest_sentence} (length: #{longest_sentence.split.length})"
end

longest_sentence("speech.txt")
# longest_sentence("gutenburg.txt")