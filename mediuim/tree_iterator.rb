# Implement an iterator over a binary search tree (BST). Your iterator will be initialized with the root node of a BST.
# 
# Calling next() will return the next smallest number in the BST.
# 
# Note: next() and hasNext() should run in average O(1) time and uses O(h) memory, where h is the height of the tree.

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end


# Uses stack to store nexts
class BSTIterator
    attr_accessor :stack
  
    # @param {TreeNode} root
    def initialize(root)
      @stack = []
      self.push_all(root)
    end

    # @return {Boolean}
    def has_next
        @stack.any?
    end

    # @return {Integer}
    def next
      node = @stack.pop()
      self.push_all(node.right)
      node.val
    end
    
    def push_all(node)
      n = node
      while n
        @stack.push(n)
        n = n.left
      end
    end
end

# Your BSTIterator will be called like this:
# i, v = BSTIterator.new(root), []
# while i.has_next()
#    v << i.next
# end