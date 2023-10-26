NUMBER_NAMES = %w(
  zero, one, two, three, four, five, six, seven, 
  eight, nine, ten, eleven, twelve, thirteen, fourteen, 
  fifteen, sixteen, seventeen, eighteen, nineteen
)

def alphabetic_number_sort(int_array)
  number_names = int_array.map{|int| NUMBER_NAMES[int]}
  number_names.sort!
  sorted = number_names.map {|number| NUMBER_NAMES.index(number)}
  sorted
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]