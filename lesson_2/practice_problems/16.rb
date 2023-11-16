=begin
  P
  - input: none
  - output: string in format "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
      - 8-4-4-4-12
      - alphanumeric
  - explicit rules:
      - no parameters
      - returns 1 random UUID per call
  - implicit rules:
      - capitalization should be random
      - any index may be a letter or a number
  E
  - "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
  D
  - starting: n/a
  - intermediate: constant array of alphanumeric characters
  - ending: string
  A
  - create a constant array variable of alphanumeric characters `ALPHANUMERIC`
  - create an empty string variable `uuid`
  - generate 32 random characters from `ALPHANUMERIC`
      - add characters to `uuid`
  - insert a `-` at indices 8, 13, 18, 23 of uuid
  - return `uuid`
=end

ALPHANUMERIC = (("A".."Z").to_a + ("a".."z").to_a + ("0".."9").to_a).freeze

def generate_uuid
  uuid = rand_str(32)
  uuid_format(uuid)
end

def rand_str(length)
  str = ''
  length.times do |i|
    str << ALPHANUMERIC.sample
  end
  str
end

def uuid_format(str)
  str.insert(8, '-')
  str.insert(13, '-')
  str.insert(18, '-')
  str.insert(23, '-')
end

5.times {|i| p generate_uuid}
