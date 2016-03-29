# Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times. The algorithm should run in linear time and in O(1) space.
# 
# Hint:
# 
# How many majority elements could it possibly have?

# @param {Integer[]} nums
# @return {Integer[]}
def majority_element(nums)
  len = nums.length
  n1, n2, c1, c2 = nil, nil, 0, 0
    
  nums.each do |num|
    if num == n1
      c1 += 1
    elsif num == n2
      c2 += 1
    elsif c1 == 0
      n1,c1 = num,1
    elsif c2 == 0
      n2,c2 = num,1
    else
      c1 -= 1
      c2 -= 1
    end
  end
  
  result = []
  result << n1 if nums.count(n1) > len/3
  result << n2 if nums.count(n2) > len/3
  result
end
