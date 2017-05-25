# https://stackoverflow.com/questions/2680548/given-an-array-of-numbers-return-array-of-products-of-all-other-numbers-no-div
# Given an array of n integers where n > 1, nums, return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
# 
# Solve it without division and in O(n).
# 
# For example, given [1,2,3,4], return [24,12,8,6].
# 
# Follow up:
# Could you solve it with constant space complexity? (Note: The output array does not count as extra space for the purpose of space complexity analysis.)

# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  n = nums.count
  arr1, arr2 = [], []
  arr1[0] = 1
  arr2[n-1] = 1
  
  (1 ... n).each do |i|
    arr1[i] = arr1[i-1] * nums[i-1]
  end
  
  (1 ... n).reverse_each do |i|
    arr2[i-1] = arr2[i] * nums[i-1]
  end
  
  new_arr = []
  (0 ... n).each do |i|
    new_arr[i] = arr1[i] * arr2[i]
  end
  
  puts "#{arr1}, #{arr2}"
  new_arr
end