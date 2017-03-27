# You have a total of n coins that you want to form in a staircase shape, where every k-th row must have exactly k coins.
# 
# Given n, find the total number of full staircase rows that can be formed.
# 
# n is a non-negative integer and fits within the range of a 32-bit signed integer.
# 
# Example 1:
# 
# n = 5
# 
# The coins can form the following rows:
# ¤
# ¤ ¤
# ¤ ¤
# 
# Because the 3rd row is incomplete, we return 2.
# Example 2:
# 
# n = 8
# 
# The coins can form the following rows:
# ¤
# ¤ ¤
# ¤ ¤ ¤
# ¤ ¤
# 
# Because the 4th row is incomplete, we return 3.
# @param {Integer} n
# @return {Integer}
def arrange_coins(n)
  return 0 if n < 1
  return 1 if n < 2
  count = 2
  total = 3
  
  while total <= n
    if ((count * (count+1)) / 2) <= total
      count += 1
      total = ((count * (count+1)) / 2)
    end
  end
  return count - 1
end