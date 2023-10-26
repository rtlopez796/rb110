def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

=begin
It will be a different object because we call `String#split` on `str`. 
This splits the input string into an array, using spaces as a 
delimiter. When we then call `String#reverse!`, we are calling it 
on each word in our new array, not on the original string object. 
Because of this, although `String#reverse!` is mutating, our `spin_me`
method is not.
=end