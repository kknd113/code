# A peak element is an element that is greater than its neighbors.
#
# Given an input array where num[i] ≠ num[i+1], find a peak element and return its index.
#
# The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.
#
# You may imagine that num[-1] = num[n] = -∞.
#
# For example, in array [1, 2, 3, 1], 3 is a peak element and your function should return the index number 2.
#
# click to show spoilers.
#
# Credits:
# Special thanks to @ts for adding this problem and creating all test cases.
#
# Subscribe to see which companies asked this question


def find_peak_element(nums)
  len = nums.count
  return 0 if len < 2

  l,m,r = 0, len/2, len-1

  while l <= r
    if nums[m] < nums[m-1]
      #look at left
      l,m,r = l, (l+m-1)/2, m-1
    elsif !nums[m+1].nil? && nums[m] < nums[m+1]
      #look at right
      l,m,r = m+1, (m+1+r)/2,r
    else
      return m
    end
  end
  return 0
end

a=[1,3,2,1]
find_peak_element(a)


# @param {Integer[]} nums
# @return {Integer}
def find_peak_element_naive(nums)
  len = nums.count

  nums.each_with_index do |num, i|
    next if i == 0
    if i == len-1
      return i if num > nums[i-1]
    else
      return i if num > nums[i-1] && num > nums[i+1]
    end
  end
  return 0
end
