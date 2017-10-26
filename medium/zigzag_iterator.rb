# Given two 1d vectors, implement an iterator to return their elements alternately.
# 
# For example, given two 1d vectors:
# 
# v1 = [1, 2]
# v2 = [3, 4, 5, 6]
# By calling next repeatedly until hasNext returns false, the order of elements returned by next should be: [1, 3, 2, 4, 5, 6].
# 
# Follow up: What if you are given k 1d vectors? How well can your code be extended to such cases?
# 
# Clarification for the follow up question - Update (2015-09-18):
# The "Zigzag" order is not clearly defined and is ambiguous for k > 2 cases. If "Zigzag" does not look right to you, replace "Zigzag" with "Cyclic". For example, given the following input:
# 
# [1,2,3]
# [4,5,6,7]
# [8,9]
# It should return [1,4,8,2,5,9,3,6,7].
# Show Company Tags
# Show Tags
# Show Similar Problems


class ZigzagIterator
    # @param {Integer[]} v1
    # @param {Integer[]} v2
    def initialize(v1, v2)
      @array = []
      max_len = [v1.count, v2.count].max
      (0...max_len).each do |i|

        @array << v1[i] if v1.count > i
        @array << v2[i] if v2.count > i
      end
      @current_index, @size = 0, @array.count
    end

    # @return {Boolean}
    def has_next
        @current_index < @size
    end

    # @return {Integer}
    def next
        n = @array[@current_index]
        @current_index += 1
        n
    end
end

# Your ZigzagIterator will be called like this:
# i, v = ZigzagIterator.new(v1, v2), []
# while i.has_next()
#    v << i.next
# end