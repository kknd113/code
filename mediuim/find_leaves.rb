# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer[][]}
def find_leaves(root)
  result = Array.new([])
  
  height = lambda do |node, result|
    return -1 if !node
    level = 0 if is_leaf(node)
    level = 1 + [height.call(node.left, result), height.call(node.right,result)].max 
    result[level] = [] if result[level].nil?
    result[level] << node.val
    return level
  end
  height.call(root,result)
  result
end

def is_leaf(node)
  return false if !node
  return !node.left && !node.right
end

root=TreeNode.new(1)
root.right = TreeNode.new(3)
root.left = TreeNode.new(2)
root.left.left = TreeNode.new(4)
root.left.right = TreeNode.new(5)