# Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
# 
# You may assume that the array is non-empty and the majority element always exist in the array.

# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  h = Hash.new(0)
  threshold = nums.length / 2
  
  nums.each do |n|
    h[n] += 1
    return n if h[n] > threshold 
  end
  nil
end
