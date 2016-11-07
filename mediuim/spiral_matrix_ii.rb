# Given an integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.
#
# For example,
# Given n = 3,
#
# You should return the following matrix:
# [
#  [ 1, 2, 3 ],
#  [ 8, 9, 4 ],
#  [ 7, 6, 5 ]
# ]

# @param {Integer} n
# @return {Integer[][]}
def generate_matrix(n)
  matrix = Array.new(n)
  matrix.each_with_index do |_, index|
    matrix[index] = Array.new(n)
  end

  x_start, x_end = 0, n-1
  y_start, y_end = 0, n-1

  num = 1
  while num <= (n*n)

    #fill top
    (x_start .. x_end).each do |x|
      matrix[y_start][x] = num
      num += 1
    end
    y_start += 1

    #fill right
    (y_start .. y_end).each do |y|
      matrix[y][x_end] = num
      num += 1
    end
    x_end -= 1

    #fill bottom
    (x_start .. x_end).reverse_each do |x|
      matrix[y_end][x] = num
      num += 1
    end
    y_end -= 1

    #fill left
    (y_start .. y_end).reverse_each do |y|
      matrix[y][x_start] = num
      puts "#{num}***#{matrix}"
      num += 1
    end
    x_start += 1
  end
  matrix
end
