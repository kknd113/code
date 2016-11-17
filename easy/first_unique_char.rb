# Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
#
# Examples:
#
# s = "leetcode"
# return 0.
#
# s = "loveleetcode",
# return 2.
# Note: You may assume the string contain only lowercase letters.
#

# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  dict = Hash.new(0)

  s.split("").each do |char|
    dict[char] += 1
  end

  dict.each do |k,v|
    return s.split("").find_index(k) if v == 1
  end

  return -1
end
