# Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.
# 
# Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.
# 
# For example, you may serialize the following tree
# 
#     1
#    / \
#   2   3
#      / \
#     4   5
# as "[1,2,3,null,null,4,5]", just the same as how LeetCode OJ serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.
# Note: Do not use class member/global/static variables to store states. Your serialize and deserialize algorithms should be stateless.
# 
# Credits:
# Special thanks to @Louis1992 for adding this problem and creating all test cases.
# 
# Show Company Tags
# Show Tags
# Show Similar Problems

# Definition for a binary tree node.




# preorder(preorder(BST)) == BST
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# Encodes a tree to a single string.
#
# @param {TreeNode} root
# @return {string}
def serialize(root)
    return [nil] if root.nil?
    return [root.val, serialize(root.left), serialize(root.right)].flatten
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)
    node = TreeNode.new(data.shift)
    return if node.val.nil?
    node.left = deserialize(data)
    node.right = deserialize(data)
    return node
end


# Your functions will be called as such:
# deserialize(serialize(data))