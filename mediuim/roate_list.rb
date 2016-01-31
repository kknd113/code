# Given a list, rotate the list to the right by k places, where k is non-negative.
# 
# For example:
# Given 1->2->3->4->5->NULL and k = 2,
# return 4->5->1->2->3->NULL.

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
  return head if k <= 0 || head.nil?
  tail=head
  len = 1
  while tail.next
    len += 1
    tail = tail.next
  end
  tail.next = head #make circular list
  
  (len - (k%len)).times do
    tail = tail.next
  end
  new_head = tail.next
  tail.next = nil
  new_head
end
