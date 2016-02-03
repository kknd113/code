# Given a linked list, remove the nth node from the end of list and return its head.
# 
# For example,
# 
#    Given linked list: 1->2->3->4->5, and n = 2.
# 
#    After removing the second node from the end, the linked list becomes 1->2->3->5.
# Note:
# Given n will always be valid.
# Try to do this in one pass.

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
    len = get_list_len(head)
    
    p = head
    if len-n <= 0
      return nil
    end
    
    prev = nil
    (len-n).times do
      prev = p
      p = p.next
    end
    if p.next.nil?
      prev.next = nil
    else
      p.val = p.next.val
      p.next = p.next.next
    end
    head
end

def get_list_len(head)
  counter = 0
  while head
    counter += 1
    head=head.next
  end
  counter
end
