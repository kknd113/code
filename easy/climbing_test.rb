# You are climbing a stair case. It takes n steps to reach to the top.
# 
# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
# 
# Note: Given n will be a positive integer.

# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  return 0 if n <= 0
  return n if n <= 2
  
  result = Array.new(n)
  result[0] = 0
  result[1] = 1
  result[2] = 2
  
  (3...n).each do |i|
    result[i] = result[i-2] + result[i-1]
  end
  result[n-1]
end