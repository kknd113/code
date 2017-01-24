# Given a non-empty string check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only and its length will not exceed 10000.
#
# Example 1:
# Input: "abab"
#
# Output: True
#
# Explanation: It's the substring "ab" twice.
# Example 2:
# Input: "aba"
#
# Output: False
# Example 3:
# Input: "abcabcabcabc"
#
# Output: True
#
# Explanation: It's the substring "abc" four times. (And the substring "abcabc" twice.)
# Subscribe to see which companies asked this question

# @param {String} str
# @return {Boolean}
def repeated_substring_pattern(str)
  strstr = (str*2)
  strstr = strstr[1,strstr.length-2]
  strstr.include? str
end
