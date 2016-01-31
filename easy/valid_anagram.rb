# Given two strings s and t, write a function to determine if t is an anagram of s.
# 
# For example,
# s = "anagram", t = "nagaram", return true.
# s = "rat", t = "car", return false.
# 
# Note:
# You may assume the string contains only lowercase alphabets.
# 
# Follow up:
# What if the inputs contain unicode characters? How would you adapt your solution to such case?

# @param {String} s
# @param {String} t
# @return {Boolean}

# O(n) solution
def is_anagram(s, t)
    return false if t.length != s.length
    return true if t.length + s.length == 0
    
    hash = Hash.new(0)
    s.split("").each do |char|
      hash[char] += 1
    end
    
    puts hash
    
    t.split("").each do |char|
      if hash[char] <= 0
        return false
      else
        hash[char] -= 1
      end
    end
    return true
end


# O(nlogn) solution
def is_anagram_2(s,t)
  return false if s.length != t.length
  
  return s.chars.sort == t.chars.sort
end
