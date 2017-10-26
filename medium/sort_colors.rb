# Given an array with n objects colored red, white or blue, sort them so that objects of the same color are adjacent, with the colors in the order red, white and blue.
#
# Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
#
# Note:
# You are not suppose to use the library's sort function for this problem.

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
  left, right = 0, nums.count - 1
  i = 0

  while i <= right
    num = nums[i]
    if num == 0
      swap(nums,i,left)
      left += 1
      i += 1
    elsif num == 1
      i += 1
    else
      swap(nums,i,right)
      right -= 1
    end
  end
end

def swap(nums, i, j)
  tmp = nums[i]
  nums[i] = nums[j]
  nums[j] = tmp
end
