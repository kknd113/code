# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  l = [p.val, q.val].min
  r = [p.val, q.val].max
  root_val = root.val

  if l == root_val || r == root_val
    return root
  elsif l > root_val
    lowest_common_ancestor(root.right, p, q)
  elsif l < root_val
    return root if r > root_val
    lowest_common_ancestor(root.left, p, q)
  end
end
