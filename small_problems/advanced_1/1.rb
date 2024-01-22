=begin
P
  - input: text file (string)
  - output: string
  - rules: fill in each 'blank' in input text w/ random word of correct part of speech
E
D
  - starting: string
  - intermediate: arrays
  - ending: string
A
  - create 4 constant arrays; adjectives, nouns, verbs, and adverbs
  - read the text file into a local variable called `mad_lib`
  - replace `%`s with `#`
  - replace `adjective` with a randome word from `ADJECTIVES`, etc
  - print result
C
=end

ADJECTIVES = %w(quick lazy sleepy ugly)
NOUNS = %w(fox dog head leg)
VERBS = %w(jumps lifts bites licks)
ADVERBS = %w(easily lazily noisily excitedly)

# def mad_libs(txt_file)
#   mad_lib = File.read(txt_file).split
#   mad_lib.each_with_index do |word, i|
#     mad_lib[i] = random_word(word) if word.start_with?("%")
#   end
#   puts mad_lib.join(" ")
# end

# def random_word(part_of_speech)
#   x = part_of_speech.split(/(\p{Punct})/)
#   case x[4]
#   when "adjective" then word = ADJECTIVES.sample
#   when "noun"      then word = NOUNS.sample
#   when "verb"      then word = VERBS.sample
#   when "adverb"    then word = ADVERBS.sample
#   else                  word = "ERROR"
#   end
#   return word + x[-1] if x.length == 8
#   word
# end

def mad_libs(txt_file)
  File.open(txt_file) do |file|
    file.each do |line|
      puts format(line, adjective: ADJECTIVES.sample,
                        noun:      NOUNS.sample,
                        verb:      VERBS.sample,
                        adverb:    ADVERBS.sample)
    end
  end
end

mad_libs("example_madlib.txt")