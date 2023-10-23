# Add up all of the ages from the Munster family hash.

ages = { 
  "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, 
  "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 
}

def add_values(hash)
  hash.values.sum
  # ages.values.inject(:+)
end

p add_values(ages)