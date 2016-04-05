# Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.
# 
# For example:
# 
# Given num = 38, the process is like: 3 + 8 = 11, 1 + 1 = 2. Since 2 has only one digit, return it.
# 
# Follow up:
# Could you do it without any loop/recursion in O(1) runtime?
# 
# Hint:
# 
# A naive implementation of the above process is trivial. Could you come up with other methods?
# What are all the possible results?
# How do they occur, periodically or randomly?
# You may find this Wikipedia article useful.


# @param {Integer} num
# @return {Integer}
def add_digits(num)
  return num if num < 10
  num - 9*((num-1)/9)
end

def add_digits_dumb(num)
  return num if num < 10
  
  result = num
  
  while result >= 10
    result = dumb_helper(result)
  end
  result
end

def dumb_helper(num)
  return num if num < 10
  result = 0
  
  while num >= 10
    result += num%10
    num /= 10
  end
  result + num
end
