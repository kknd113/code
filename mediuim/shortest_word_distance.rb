# Given a list of words and two words word1 and word2, return the shortest distance between these two words in the list.
# 
# For example,
# Assume that words = ["practice", "makes", "perfect", "coding", "makes"].
# 
# Given word1 = “coding”, word2 = “practice”, return 3.
# Given word1 = "makes", word2 = "coding", return 1.
# 
# Note:
# You may assume that word1 does not equal to word2, and word1 and word2 are both in the list.


def shortest_distance(words, word1, word2)
  min = words.count
  i1, i2 = -1, -1
  
  words.each_with_index do |word, i|
    if word == word1
      i1 = i
    elsif word == word2
      i2 = i
    end
    
    if i1 != -1 && i2 != -1
      diff = (i1 - i2).abs
      min = diff if diff < min
    end
  end
  min
end


# @param {String[]} words
# @param {String} word1
# @param {String} word2
# @return {Integer}
def shortest_distance_naive(words, word1, word2)
  h = get_hash(words)
  word1_indices, word2_indices = h[word1], h[word2]
  
  min = words.count
  word1_indices.each do |w1_index|
    word2_indices.each do |w2_index|
      diff = (w1_index - w2_index).abs
      min = diff if diff < min 
    end
  end
  return min
end

def get_hash(words)
  h = Hash.new([])
  words.each_with_index do |word, index|
    h[word] = h[word] + [index]
  end
  h
end