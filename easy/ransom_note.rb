# Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.
# 
# Each letter in the magazine string can only be used once in your ransom note.
# 
# Note:
# You may assume that both strings contain only lowercase letters.
# 
# canConstruct("a", "b") -> false
# canConstruct("aa", "ab") -> false
# canConstruct("aa", "aab") -> true

# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
  h = Hash.new(0)
  
  magazine.each_char do |char|
    h[char] += 1
  end
  
  ransom_note.each_char do |char|
    h[char]-=1
  end
  return true
end