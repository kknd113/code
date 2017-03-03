# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right, :visited
    def initialize(val)
        @val = val
        @left, @right = nil, nil
        @visited = false
    end
    
    def insertLeft(val)
      return if self.left
      n = TreeNode.new(val)
      self.left = n
    end
    
    def insertRight(val)
      return if self.right
      n = TreeNode.new(val)
      self.right = n
    end
end

root = TreeNode.new(1)
root.insertLeft(2)
root.insertRight(3)
l,r = root.left, root.right

l.insertLeft(4)
l.insertRight(5)
r.insertLeft(6)
r.insertRight(7)

def dfs(root)
  return if root.nil?
  puts root.val
  dfs(root.left)
  dfs(root.right)
end

def dfs_iterative(root)
  stack = [root]
  
  while stack.any?
    n = stack.pop
    if !n.visited
      puts n.val
      stack.push(n.right) if n.right && !n.right.visited
      stack.push(n.left) if n.left && !n.left.visited
    end
  end
end