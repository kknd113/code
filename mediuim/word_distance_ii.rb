class WordDistance
  attr_accessor :index_hash, :min
  def initialize(words)
    set_hash(words)
    @min = words.count
  end
  
  def set_hash(words)
    @index_hash = Hash.new([])
    words.each_with_index do |word, index|
      @index_hash[word] = @index_hash[word] + [index]
    end
  end

  def shortest(word1, word2)
    word1_indices, word2_indices = @index_hash[word1], @index_hash[word2]
    word1_indices.each do |i1|
      word2_indices.each do |i2|
        diff = (i1 - i2).abs
        @min = diff if diff < @min
      end
    end
    @min
  end
end