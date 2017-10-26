# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode}
def upside_down_binary_tree(root)
  return root if root.nil? || root.left.nil?
  
  newRoot = upside_down_binary_tree(root.left)
  root.left.left = root.right
  root.left.right = root
  root.left, root.right = nil, nil
  newRoot
end