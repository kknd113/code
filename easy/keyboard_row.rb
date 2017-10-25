# Given a List of words, return the words that can be typed using letters of alphabet on only one row's of American keyboard like the image below.
# 
# 
# American keyboard
# 
# 
# Example 1:
# Input: ["Hello", "Alaska", "Dad", "Peace"]
# Output: ["Alaska", "Dad"]
# Note:
# You may use one character in the keyboard more than once.
# You may assume the input string will only contain letters of alphabet.

# @param {String[]} words
# @return {String[]}
def find_words(words)
  rows = [
    %w(q w e r t y u i o p),
    %w(a s d f g h j k l),
    %w(z x c v b n m)
  ]
  
  result = []
  
  words.each do |word|
    rows.each do |row|
      if (word.downcase.split('') - row).empty?
        result << word 
        break
      end
    end
  end
  result
end