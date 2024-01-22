=begin
E
  - transposed_matrix[0] = [matrix[0][1], matrix[1][1], matrix[2][1]]
A
  - create an empty array called `transposed_matrix`
  - # times the length of `matrix`
      - transposed_matrix[i] = [matrix[0][i+1], matrix[1][i+1], matrix[2][i+1]]
=end

def transpose(matrix)
  transposed_matrix = []
  matrix.length.times do |i|
    transposed_matrix[i] = [matrix[0][i], matrix[1][i], matrix[2][i]]
  end
  transposed_matrix
end

def transpose!(matrix)
  original = matrix.length
  original.times do |i|
    matrix << [matrix[0][i], matrix[1][i], matrix[2][i]]
  end
  matrix.shift(original)
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

transpose!(matrix)

p matrix