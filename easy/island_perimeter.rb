# You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water. Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells). The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.
# 
# [[0,1,0,0],
#  [1,1,1,0],
#  [0,1,0,0],
#  [1,1,0,0]]
# 
# Answer: 16

# @param {Integer[][]} grid
# @return {Integer}
def island_perimeter(grid)
  perim = 0
  (0 ... grid.count).each do |i|
    (0 ... grid[i].count).each do |j|
      if is_island(grid, i, j)
        perim += perim_count(grid, i, j)
      end
    end
  end
  perim
end

def is_island(grid, i, j)
  return false if i < 0 || j < 0 || i >= grid.count || j >= grid[i].count
  grid[i][j] == 1
end

def perim_count(grid, i, j)
  i_max, j_max = grid.count, grid[i].count
  count = 4
  # check_left
  count -=1 if is_island(grid, i-1, j)
  # check_right
  count -=1 if is_island(grid, i+1, j)
  # check_top
  count -=1 if is_island(grid, i, j-1)
  # check_bottom
  count -=1 if is_island(grid, i, j+1)
  count
end