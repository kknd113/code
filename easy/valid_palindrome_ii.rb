# Given a non-empty string s, you may delete at most one character. Judge whether you can make it a palindrome.
# 
# Example 1:
# Input: "aba"
# Output: True
# Example 2:
# Input: "abca"
# Output: True
# Explanation: You could delete the character 'c'.
# Note:
# The string will only contain lowercase characters a-z. The maximum length of the string is 50000.

def valid_palindrome(s)
  i,j = 0, s.length - 1
  
  while i < j
    if s[i] == s[j]
      i += 1
      j -= 1
    else
      return is_palindrome(s[0...i] + s[i+1..-1]) || is_palindrome(s[0...j] + s[j+1..-1])
    end
  end
  return true
end

def is_palindrome(str)
  return str.reverse == str
end