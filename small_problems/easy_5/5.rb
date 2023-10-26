def cleanup(string)
  string.gsub!(/[^a-z]/, ' ') # replace all non lowercase alphabetic characters with a space
  string.gsub!(/\s{2,}/, ' ') # replace any consecutive spaces with a single space (could have used `String#squeeze!`)
end

p cleanup("---what's my +*& line?") == ' what s my line '