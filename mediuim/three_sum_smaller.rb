# Given an array of n integers nums and a target, find the number of index triplets i, j, k with 0 <= i < j < k < n that satisfy the condition nums[i] + nums[j] + nums[k] < target.
# 
# For example, given nums = [-2, 0, 1, 3], and target = 2.
# 
# Return 2. Because there are two triplets which sums are less than 2:
# 
# [-2, 0, 1]
# [-2, 0, 3]
# Follow up:
# Could you solve it in O(n2) runtime?

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_smaller(nums, target)
  count = 0
  return count if nums.count < 3
  
  nums.each_with_index do |num,i|
      break if i > nums.count-2
      count += two_sum_smaller(nums[i+1..-1], target - num)
  end
  count
end

def two_sum_smaller(nums, target)

  count = 0
  return count if nums.count < 2
  nums.sort!
  i,j = 0, nums.count-1
  while i < j
    total = nums[i] + nums[j]
    if total >= target
      j -= 1
    else
      count += (j-i)
      i += 1
    end
  end
  count
end