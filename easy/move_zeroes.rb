# Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
# 
# For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
#  [0,0,1,2,3]
# Note:
# You must do this in-place without making a copy of the array.
# Minimize the total number of operations.

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  i = nums.index(0)
  return nums if i.nil?
  j = i
  (i...nums.count).each do |index|
    x = nums[index]
    if x != 0
      nums[index] = 
    end
  end
end
