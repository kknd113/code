# Given an array of strings, group anagrams together.
# 
# For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"], 
# Return:
# 
# [
#   ["ate", "eat","tea"],
#   ["nat","tan"],
#   ["bat"]
# ]



# @param {String[]} strs
# @return {String[][]}

# O(n) solution
def group_anagrams(strs)
    sorted_hash = Hash.new(nil)
    
    strs.each do |str|
      sorted_str = str.chars.sort.join("")
      
      if sorted_hash[sorted_str].nil?
        sorted_hash[sorted_str] = [str]
      else
        sorted_hash[sorted_str] << str
      end
    end
    sorted_hash.values.map(&:sort)
end
