# Given a linked list, swap every two adjacent nodes and return its head.
# 
# For example,
# Given 1->2->3->4, you should return the list as 2->1->4->3.
# 
# Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
    node = head
    while(head && head.next)
      next_node = head.next
      next_val = next_node.val
      
      next_node.val = head.val
      head.val = next_val
      head = head.next.next
    end
    node
end
