# Given a binary tree, find the length of the longest consecutive sequence path.
# 
# The path refers to any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The longest consecutive path need to be from parent to child (cannot be the reverse).
# 
# For example,
#    1
#     \
#      3
#     / \
#    2   4
#         \
#          5
# Longest consecutive sequence path is 3-4-5, so return 3.
#    2
#     \
#      3
#     / 
#    2    
#   / 
#  1
# Longest consecutive sequence path is 2-3,not3-2-1, so return 2.
# Show Company Tags
# Show Tags
# Show Similar Problems
# Have you met this question in a real interview? Yes  
# # @param {TreeNode} root
# # @return {Integer}

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def longest_consecutive(root)
    return 0 if root.nil?
    left, right = dfs(root.left, root.val, 1), dfs(root.right, root.val, 1)
    [left,right].max
end

def dfs(root, prev_val, prev_count)
  return prev_count if root.nil?
  
  count = prev_val + 1 == root.val ? prev_count + 1 : 1
  left = dfs(root.left, root.val, count)
  right = dfs(root.right, root.val, count)
  return [[left,right].max, count].max
end

def longest_consecutive_iter(root)
  ans, stack = 0, [[root, 1]]
  return 0 if root.nil?
  while stack.any?
    node, len = stack.pop
    ans = [ans, len].max

    for child in [node.left, node.right] do
      next if child.nil?
      if node.val + 1 == child.val
          stack.push([child, len + 1])
        else
          stack.push([child, 1])
        end
    end
  end
  ans
end