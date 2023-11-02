def staggered_case(str, starting_case: "uppercase", count_nonalpha: true)
  result = ''
  i = is_downcase?(starting_case)

  str.chars.each do |char|
    if !char.match?(/[A-Za-z]/) && count_nonalpha == true
      result << char
      next
    elsif i.even?
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

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('I Love Launch School!', count_nonalpha: false) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', count_nonalpha: false) == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', count_nonalpha: false) == 'IgNoRe 77 ThE 444 NuMbErS'