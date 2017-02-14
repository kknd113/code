# Given a positive integer num, write a function which returns True if num is a perfect square else False.
#
# Note: Do not use any built-in library function such as sqrt.
#
# Example 1:
#
# Input: 16
# Returns: True
# Example 2:
#
# Input: 14
# Returns: False
# Credits:
# Special thanks to @elmirap for adding this problem and creating all test cases.
#
# Subscribe to see which companies asked this question
#
# Show Tags
# Show Similar Problems

# @param {Integer} num
# @return {Boolean}
def is_perfect_square(num)
  return true if num == 1
  p = num / 4
  l,r = 0, num
  while p > 0 && p < (num/2)
    result = p*p
    if result == num
      return true
    elsif result > num
      p = (l + p) / 2
      r = p
    else
      p = (p + r) / 2
      l = p
    end
  end
  return false
end
