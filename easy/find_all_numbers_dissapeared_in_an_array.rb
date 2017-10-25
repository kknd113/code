# Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
# 
# Find all the elements of [1, n] inclusive that do not appear in this array.
# 
# Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
# 
# Example:
# 
# Input:
# [4,3,2,7,8,2,3,1]
# 
# Output:
# [5,6]

# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
  nums.each do |num|
    idx = (num).abs - 1
    nums[idx] = -nums[idx] if nums[idx] > 0
  end
  
  result = []
  (0 ... nums.count).each do |i|
    result << i+1 if nums[i] > 0
  end
  result
end