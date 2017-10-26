# Given a sorted array consisting of only integers where every element appears twice except for one element which appears once. Find this single element that appears only once.
# 
# Example 1:
# Input: [1,1,2,3,3,4,4,8,8]
# Output: 2
# Example 2:
# Input: [3,3,7,7,10,11,11]
# Output: 10
# Note: Your solution should run in O(log n) time and O(1) space.

# @param {Integer[]} nums
# @return {Integer}
def single_non_duplicate(nums)
  i, j = 0, nums.length - 1
  
  while i < j
    mid = (i + j) / 2
    mid - 1 if (mid % 2) == 1
    
    if nums[mid] != nums[mid+1]
      #look left
      j = mid
    else
      #look right
      i = mid + 2
    end
  end
  return nums[i]
end