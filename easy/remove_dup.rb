# Given a sorted linked list, delete all duplicates such that each element appear only once.
# 
# For example,
# Given 1->1->2, return 1->2.
# Given 1->1->2->3->3, return 1->2->3.
# 

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
def delete_duplicates(head)
  return head if head.nil?
  
  new_head = head
  
  while head.next
    val = head.val
    next_val = head.next.val
    
    if val == next_val
      head.next = head.next.next
    else
      head = head.next
    end
  end
  new_head
end
