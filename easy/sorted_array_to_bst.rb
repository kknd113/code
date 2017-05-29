# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
    return nil if !nums.any?
    return TreeNode.new(nums.first) if nums.count == 1
    
    mid = nums.count / 2
    root = TreeNode.new(nums[mid])
    root.left = sorted_array_to_bst(nums[0...mid])
    root.right = sorted_array_to_bst(nums[mid+1 ... nums.count])
    root
end