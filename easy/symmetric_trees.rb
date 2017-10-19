# Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
# 
# For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
# 
#     1
#    / \
#   2   2
#  / \ / \
# 3  4 4  3
# But the following [1,2,2,null,3,null,3] is not:
#     1
#    / \
#   2   2
#    \   \
#    3    3
# Note:
# Bonus points if you could solve it both recursively and iteratively.

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
  return true if !root
  return is_mirror(root.left, root.right)
end

def is_mirror(r1,r2)
  return true if !r1 && !r2
  return false if !r1 || !r2
  
  return (r1.val == r2.val) && (is_mirror(r1.left, r2.right)) && (is_mirror(r1.right, r2.left))
end

