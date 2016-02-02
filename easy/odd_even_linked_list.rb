# Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.
# 
# You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.
# 
# Example:
# Given 1->2->3->4->5->NULL,
# return 1->3->5->2->4->NULL.
# 
# Note:
# The relative order inside both the even and odd groups should remain as it was in the input. 
# The first node is considered odd, the second node even and so on ...



# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end


# Example:
# Given 1->2->3->4->5->NULL,
# return 1->3->5->2->4->NULL.

# @param {ListNode} head
# @return {ListNode}
def odd_even_list(head)
  return head if head.nil? || head.next.nil? || head.next.next.nil?
  even = head
  odd = head.next
  odd_head = odd
  even_tail = even
  
  while even && odd
    even.next = odd.next
    if even.next
      odd.next = even.next.next
    end
    even = even.next
    odd = odd.next
    even_tail = even if !even.nil?
  end
  even_tail.next = odd_head
  head
    
end
