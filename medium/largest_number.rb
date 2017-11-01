# 
# Given a list of non negative integers, arrange them such that they form the largest number.
# 
# For example, given [3, 30, 34, 5, 9], the largest formed number is 9534330.
# 
# Note: The result may be very large, so you need to return a string instead of an integer.
# 
# Credits:
# Special thanks to @ts for adding this problem and creating all test cases.
class String
  def < (str)
    (self + str).to_i < (str + self).to_i
  end
  
  def > (str)
    (self + str).to_i > (str + self).to_i
  end
  
  def <=> (str)
    return -1 if self < str
    return 0 if self == str
    return 1 if self > str
  end
end
# @param {Integer[]} nums
# @return {String}
def largest_number(nums)
  nums.map! { |n| n.to_s }
  nums.sort!.reverse.join('')
end