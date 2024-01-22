=begin
P
  - input: mxn matrix (array)
  - output: rotated matrix
  - rules:
      - explicit:
          - given mxn matrix, return new matrix rotated 90 degrees
E
  3  4  1
  9  7  5

    is

  9  3    5 7 9   
  7  4    1 4 3
  5  1
D
  - starting: nested array
  - intermediate: array
  - ending: new nested array
A
  - create an empty array called `result`
  - for each sub array, starting from the last and working backwards...
    - take the first element add it to `new_row`
    - push `new row` to `result`
    - decrement `current_array`
  - return `result`
C
=end

def rotate90(matrix)
  result = []
  num_of_rows = matrix.first.length - 1
  num_of_colomns = matrix.length - 1
  (0..num_of_rows).each do |row_index|
    new_row = (num_of_colomns.downto(0)).map { |column_index| matrix[column_index][row_index] }
    result << new_row
  end
  result
end

VALID_ROTATIONS = [90, 180, 270, 360]

def rotate(matrix, rotation=90)
  return matrix if rotation == 360
  if !VALID_ROTATIONS.include?(rotation)
    puts "Error: invalid rotation argument"
    return
  end
  case rotation
  when 90 then rotate90(matrix)
  when 180 then rotate90(rotate90(matrix))
  when 270 then rotate90(rotate90(rotate90(matrix)))
  end
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2

new_matrix1 = rotate(matrix2, rotation=180)
new_matrix2 = rotate(matrix2, rotation=270)
new_matrix3 = rotate(matrix2, rotation=360)
new_matrix4 = rotate(matrix2, rotation=30)

p new_matrix1 == [[8, 0, 1, 5], [2, 4, 7, 3]]
p new_matrix2 == [[2, 8], [4, 0], [7, 1], [3, 5]]
p new_matrix3 == matrix2
p new_matrix4 == nil