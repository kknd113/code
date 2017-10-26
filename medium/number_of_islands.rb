# Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
# 
# Example 1:
# 
# 11110
# 11010
# 11000
# 00000
# Answer: 1
# 
# Example 2:
# 
# 11000
# 11000
# 00100
# 00011

# Sink each island as we scan!
# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  count = 0
  grid.each_with_index do |ival, i|
    ival.each_with_index do |jval, j|
      unless jval == "0"
        count += 1
        sink(grid, i, j)
      end
    end
  end
  count
end

def sink(grid, i, j)
  return if grid[i][j] == "0"
  grid[i][j] = "0"
  sink(grid, i-1 ,j) if i-1 >= 0
  sink(grid, i, j-1) if j-1 >= 0
  sink(grid, i, j+1) if j+1 < grid[i].count
  sink(grid, i+1, j) if i+1 < grid.count
end