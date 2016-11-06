# Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.
#
# For example,
# Given nums = [0, 1, 3] return 2.
#
# Note:
# Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?
#
# Credits:
# Special thanks to @jianchao.li.fighter for adding this problem and creating all test cases.
#
# Subscribe to see which companies asked this question

# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  n = nums.count
  total = (n*(n+1)) / 2

  nums.each do |num|
    total -= num
  end

  total
end
