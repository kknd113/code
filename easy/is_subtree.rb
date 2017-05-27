# Given two non-empty binary trees s and t, check whether tree t has exactly the same structure and node values with a subtree of s. A subtree of s is a tree consists of a node in s and all of this node's descendants. The tree s could also be considered as a subtree of itself.
# 
# Example 1:
# Given tree s:
# 
#      3
#     / \
#    4   5
#   / \
#  1   2
# Given tree t:
#    4 
#   / \
#  1   2
# Return true, because t has the same structure and node values with a subtree of s.
# Example 2:
# Given tree s:
# 
#      3
#     / \
#    4   5
#   / \
#  1   2
#     /
#    0
# Given tree t:
#    4
#   / \
#  1   2

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} s
# @param {TreeNode} t
# @return {Boolean}
def is_subtree(s, t)
  puts inorder(s).join('')
  puts inorder(t).join('')
  inorder(s).join('').include?(inorder(t).join(''))
end

def inorder(node)
  result = []
  return [] if node.nil?
  result = result + inorder(node.left)
  result << node.val
  result = result + inorder(node.right)
  return result
end