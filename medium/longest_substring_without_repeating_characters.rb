# Given a string, find the length of the longest substring without repeating characters.
# 
# Examples:
# 
# Given "abcabcbb", the answer is "abc", which the length is 3.
# 
# Given "bbbbb", the answer is "b", with the length of 1.
# 
# Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.




# @param {String} s
# @return {Integer}
def length_of_longest_substring_noob(s)
  ans, i, j = 0,0,0
  n = s.length
  dict = Hash.new()
  
  while i < n && j < n
    if dict[s[j]] #same character exists, move the head!
      dict[s[i]] = nil
      i+=1
    else #no same character so far, move the tail!
      dict[s[j]] = j
      j+=1
      ans = [ans, j-i].max
    end
  end
  ans
end

def length_of_longest_substring(s)
  ans = 0
  start = 0
  dict = Hash.new
  
  s.each_char.with_index do |char, index|
    
    if dict[char] #char exists, slide!
      start = dict[char] + 1 if dict[char] + 1 > start
    end
    dict[char] = index
    ans = [ans,index-start+1].max
  end
  ans
end

