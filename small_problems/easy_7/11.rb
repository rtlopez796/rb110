def count_occurrences(arr)
  counts = Hash.new(0)

  arr.each {|elem| counts[elem] += 1}
  counts.each {|k, v| puts "#{k} => #{v}"}
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)