# Write a function to find the longest common prefix string amongst an array of strings.
# 

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
    return "" if strs.empty?
    ans = strs.first
    strs.each do |str|
      ans = common_prefix(ans,str)
    end
    ans
end

def common_prefix(str1, str2)
  while !str1.empty? && str2.index(str1) != 0
    str1 = str1[0...str1.length-1]
  end
  str1
end