# Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
# 
# For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
# the contiguous subarray [4,-1,2,1] has the largest sum = 6.
# 
# click to show more practice.
# 
# More practice:
# If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
# 

# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  max_here = nums[0]
  max_so_far = nums[0]
  
  nums[1..-1].each do |num|
    max_here = [num, num+max_here].max
    max_so_far = max_here > max_so_far ? max_here : max_so_far
    puts "max_here: #{max_here}, max_so_far: #{max_so_far}"
  end
  max_so_far
end