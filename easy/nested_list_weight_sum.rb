# Given a nested list of integers, return the sum of all integers in the list weighted by their depth.
# 
# Each element is either an integer, or a list -- whose elements may also be integers or other lists.
# 
# Example 1:
# Given the list [[1,1],2,[1,1]], return 10. (four 1's at depth 2, one 2 at depth 1)
# 
# Example 2:
# Given the list [1,[4,[6]]], return 27. (one 1 at depth 1, one 4 at depth 2, and one 6 at depth 3; 1 + 4*2 + 6*3 = 27)
# 

# This is the interface that allows for creating nested lists.
# You should not implement it, or speculate about its implementation
#
#class NestedInteger
#    def is_integer()
#        """
#        Return true if this NestedInteger holds a single integer, rather than a nested list.
#        @return {Boolean}
#        """
#
#    def get_integer()
#        """
#        Return the single integer that this NestedInteger holds, if it holds a single integer
#        Return nil if this NestedInteger holds a nested list
#        @return {Integer}
#        """
#
#    def get_list()
#        """
#        Return the nested list that this NestedInteger holds, if it holds a nested list
#        Return nil if this NestedInteger holds a single integer
#        @return {NestedInteger[]}
#        """

# @param {NestedInteger[]} nested_list
# @return {Integer}
def depth_sum(nested_list)  
  depth_sum_helper(nested_list, 1)
end

def depth_sum_helper(nested_list, depth)
  sum = 0
  nested_list.each do |list|
    if list.is_integer()
      sum += (depth*list.get_integer())
    else
      sum += depth_sum_helper(list.get_list(), depth+1)
    end
  end
  sum
end