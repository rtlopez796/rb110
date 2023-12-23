=begin  
P
  - input: 3 ints
  - output: string
  - rules:
      - explicit: 
          - given 3 grades as ints, find average and convert to letter grade
          - values will be between 0 and 100, inclusive
E
D
  - starting: int
  - intermediate: int
  - ending: string
A
  - add 3 ints, divide by 3, save to `final_grade`
  - if final grade is...
      - < 60 => 'F'
      - < 70 => 'D'
      - < 80 => 'C'
      - < 90 => 'B'
      - else, 'A'
C
=end

def get_grade(grade1, grade2, grade3)
  final_grade = (grade1 + grade2 + grade3) / 3
  case final_grade
  when 0..59 then 'F'
  when 60..69 then 'D'
  when 70..79 then 'C'
  when 80..89 then 'B'
  else 'A'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"