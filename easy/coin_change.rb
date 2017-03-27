# You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
# 
# Example 1:
# coins = [1, 2, 5], amount = 11
# return 3 (11 = 5 + 5 + 1)
# 
# Example 2:
# coins = [2], amount = 3
# return -1.
# 
# Note:
# You may assume that you have an infinite number of each kind of coin.
# 
# Credits:
# Special thanks to @jianchao.li.fighter for adding this problem and creating all test cases.

# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}

# DP[i] = "Min number of coins to make amount i using coins{v0,....,vj}"
# DP[i] = MIN{ DP[i - Coin_j] + 1, MAX }
def coin_change(coins, amount)
  dp = [amount+1] * [amount + 1]
  dp[0] = 0
  (1 ... dp.count).each do |i|
    results = []
    coins.each do |coin|
      results << dp[i-coin] + 1 if coin <= i
    end
    results << dp[i]
    dp[i] = results.min
  end
  return dp[amount] > amount ? -1 : dp[amount]
end

# class Solution(object):
#     def coinChange(self, coins, amount):
#         """
#         :type coins: List[int]
#         :type amount: int
#         :rtype: int
#         """
#         max = amount + 1
#         dp = [max]*(max)
#         dp[0] = 0
#         for i in range(0,len(dp)):
#             for coin in coins:
#                 if (coin <= i):
#                     dp[i] = min(dp[i-coin]+1, dp[i])
#                 
#             
#         if dp[amount] > amount:
#             return -1
#         else:
#             return dp[amount]
#             