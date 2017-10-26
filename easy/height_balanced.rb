# Given a binary tree, determine if it is height-balanced.
# 
# For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right, :height
    def initialize(val)
        @val = val
        @left, @right = nil, nil
        @height = nil
    end
end

root = TreeNode.new(10)
root.right = TreeNode.new(9)
root.left = TreeNode.new(8)
root.left.left = TreeNode.new(10)
root.right.right = TreeNode.new(1)
root.right.right.left = TreeNode.new(3)

# @param {TreeNode} root
# @return {Boolean}
def is_balanced(root)
  is_balanced_helper(root) != -1
end

def is_balanced_helper(root)
  return 0 if !root
  l,r = is_balanced_helper(root.left), is_balanced_helper(root.right)
  return -1 if (l == -1 || r == -1) || (l-r).abs > 1
  return 1 + [l,r].max
end

def set_height(root)
  return 0 if !root || is_leaf(root)
  height = 1 + [set_height(root.left), set_height(root.right)].max
  root.height = height
  height
end