# Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

l1 = ListNode.new(1)
l2 = ListNode.new(2)
l3 = ListNode.new(3)
l4 = ListNode.new(4)
l5 = ListNode.new(5)
l6 = ListNode.new(6)
l7 = ListNode.new(7)
l1.next=l2
l2.next=l3
l3.next=l4
l4.next=l5
l5.next=l6
l6.next=l7


# @param {ListNode} head
# @return {TreeNode}
def sorted_list_to_bst(head)
  len = get_list_len(head)
  sorted_list_to_bst_helper(head,len)
end

def sorted_list_to_bst_helper(head, len)
  return nil if len == 0
  return TreeNode.new(head.val) if len == 1
  
  mid = len/2
  mid_node = get_nth_node(head,mid)
  root = TreeNode.new(mid_node.val)
  root.left = sorted_list_to_bst_helper(head,mid)
  root.right = sorted_list_to_bst_helper(mid_node.next,len-mid-1)
  root
end

def get_nth_node(head,n)
  n.times do
    head = head.next
  end
  return head
end

def get_list_len(head)
  counter = 0
  while head
    counter += 1
    head = head.next
  end
  counter
end


sorted_list_to_bst(l1)
