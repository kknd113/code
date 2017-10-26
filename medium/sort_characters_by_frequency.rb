# Given a string, sort it in decreasing order based on the frequency of characters.
# 
# Example 1:
# 
# Input:
# "tree"
# 
# Output:
# "eert"
# 
# Explanation:
# 'e' appears twice while 'r' and 't' both appear once.
# So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
# Example 2:
# 
# Input:
# "cccaaa"
# 
# Output:
# "cccaaa"
# 
# Explanation:
# Both 'c' and 'a' appear three times, so "aaaccc" is also a valid answer.
# Note that "cacaca" is incorrect, as the same characters must be together.
# Example 3:
# 
# Input:
# "Aabb"
# 
# Output:
# "bbAa"
# 
# Explanation:
# "bbaA" is also a valid answer, but "Aabb" is incorrect.
# Note that 'A' and 'a' are treated as two different characters.
# @param {String} s
# @return {String}
def frequency_sort(s)
  freq_hash = get_frequency_hash(s)
  sorted_hash = freq_hash.sort_by { |key,val| -val }
  result = ""
  
  sorted_hash.each do |key, val|
    val.to_i.times do
      result << key
    end
  end
  result
end

def get_frequency_hash(s)
  hash = Hash.new(0)
  
  s.split('').each do |char|
    hash[char] += 1
  end
  hash
end
