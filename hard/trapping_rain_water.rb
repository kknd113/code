# @param {Integer[]} height
# @return {Integer}

def trap_naive(height)
  max_to_left_arr, max_to_right_arr = calculateMaxLeftRight(height)
  water = 0
  
  height.each_with_index do |w, i|
    min_neighbor = [max_to_left_arr[i], max_to_right_arr[i]].min
    water += min_neighbor - w if min_neighbor > w
  end
  water
end

def calculateMaxLeftRight(height)
  max_left_arr, max_right_arr = [], []
  
  maximum = 0
  (0 ... height.count).each do |i|
    max_left_arr[i] = maximum
    maximum = height[i] if height[i] > maximum
  end
  
  maximum = 0
  (0 ... height.count).reverse_each do |i|
    max_right_arr[i] = maximum
    maximum = height[i] if height[i] > maximum
  end
  
  [max_left_arr, max_right_arr]
end