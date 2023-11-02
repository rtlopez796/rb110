def staggered_case(str)
  result = ''

  str.chars.each_with_index do |char, i|
    if i.even?
      result << char.upcase
    else
      result << char.downcase
    end
  end
  result
end

# allows for optional argument for starting case
def staggered_case_2(str, starting_case: "uppercase")
  result = ''
  i = is_downcase?(starting_case)

  str.chars.each do |char|
    if i.even?
      result << char.upcase
    else
      result << char.downcase
    end
    i += 1
  end
  result
end

def is_downcase?(str = 'uppercase')
  return 1 if str != "uppercase"
  0
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'