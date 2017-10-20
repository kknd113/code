# 
# Given a Binary Search Tree (BST), convert it to a Greater Tree such that every key of the original BST is changed to the original key plus sum of all keys greater than the original key in BST.
# 
# Example:
# 
# Input: The root of a Binary Search Tree like this:
#               5
#             /   \
#            2     13
# 
# Output: The root of a Greater Tree like this:
#              18
#             /   \
#           20     13
# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {TreeNode}
def convert_bst(root)
    converter(root,0)
    return root
end

def converter(node, sum_so_far)
  return sum_so_far if !node
  
  r_sum = converter(node.right, sum_so_far)
  node.val = node.val + r_sum
  converter(node.left, node.val)
end