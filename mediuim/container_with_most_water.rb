# Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
# 
# Note: You may not slant the container and n is at least 2.

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  i, j = 0, height.length - 1
  max = 0
  while i < j
    width = j - i
    if height[i] > height[j]
      longer, shorter = i, j
      j -= 1
    else
      longer, shorter = j, i
      i += 1
    end
    
    area = height[shorter] * width
    max = area if area > max
  end  
  max
end