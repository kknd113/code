# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
#
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
#
# Example:
# Given nums = [2, 7, 11, 15], target = 9,
#
# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].

# O(n) space, O(n) time
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  l,r = 0, nums.count-1
  while l < r
    total = nums[l] + nums[r]

    if target == total
      return [l+1,r+1]
    elsif target < total
      r -= 1
    else
      l += 1
    end
  end
  return nil
end
