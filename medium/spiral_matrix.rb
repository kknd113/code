  # Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
  #
  # For example,
  # Given the following matrix:
  #
  # [
  #  [ 1, 2, 3 ],
  #  [ 4, 5, 6 ],
  #  [ 7, 8, 9 ]
  # ]
  # You should return [1,2,3,6,9,8,7,4,5].

  mat = [ [1,2,3], [4,5,6], [7,8,9] ]
  # @param {Integer[][]} matrix
  # @return {Integer[]}
  def spiral_order(matrix)
    return matrix if matrix.count < 1
    return matrix[0] if matrix.count == 1


    x_start, x_end = 0, matrix.first.count - 1
    y_start, y_end = 0, matrix.count - 1
    result = []
    while x_start <= x_end  && y_start <= y_end

      # get top
      (x_start .. x_end).each do |x|
        result << matrix[y_start][x]
      end
      y_start += 1

      # get right
      (y_start .. y_end).each do |y|
        result << matrix[y][x_end]
      end
      x_end -= 1

      #get bottom
      (x_start .. x_end).reverse_each do |x|
        result << matrix[y_end][x] if y_start <= y_end
      end
      y_end -= 1

      #get left
      (y_start .. y_end).reverse_each do |y|
        result << matrix[y][x_start] if x_start <= x_end
      end
      x_start += 1
    end
    result
  end
