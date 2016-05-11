# @param {String} pattern
# @param {String} str
# @return {Boolean}

# Given a pattern and a string str, find if str follows the same pattern.
# 
# Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in str.
# 
# Examples:
# pattern = "abba", str = "dog cat cat dog" should return true.
# pattern = "abba", str = "dog cat cat fish" should return false.
# pattern = "aaaa", str = "dog cat cat dog" should return false.
# pattern = "abba", str = "dog dog dog dog" should return false.

def word_pattern(pattern, str)
  pattern = pattern.split('')
  str = str.split(' ')
  return false if pattern.count != str.count
  
  dict = Hash.new()
  last = nil
  (0...pattern.count).each do |i|
    if dict[pattern[i]].nil?
      return false if dict.has_value?(str[i])
      dict[pattern[i]] = str[i]
    else
      return false if dict[pattern[i]] != str[i]
    end
  end
  true
end
