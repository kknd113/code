# Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
# 
# If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
# 
# You may not alter the values in the nodes, only nodes itself may be changed.
# 
# Only constant memory is allowed.
# 
# For example,
# Given this linked list: 1->2->3->4->5
# 
# For k = 2, you should return: 2->1->4->3->5
# 
# For k = 3, you should return: 3->2->1->4->5

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
def reverse_k_group(head, k)
    return head if head.nil? || k <= 1
    
    dummy = ListNode.new(nil)
    dummy.next = head
    prev = dummy
    count = 0
    
    while head
      count += 1
      if (count % k == 0)
        prev = reverse(prev, head.next)
        if count <= k
          dummy.next = head
        end
        head = prev.next
      else
        head = head.next
      end
    end
    dummy.next
end

# * Reverse a link list between pre and next exclusively
#      * an example:
#      * a linked list:
#      * 0->1->2->3->4->5->6
#      * |           |   
#      * pre        next
#      * after call pre = reverse(pre, next)
#      * 
#      * 0->3->2->1->4->5->6
#      *          |  |
#      *          pre next
def reverse(prev, nex)
  last = prev.next
  cur = last.next
  
  while cur != nex
    
    last.next = cur.next
    cur.next = prev.next
    prev.next = cur
    
    cur = last.next
  end
  return last
end

a0,a1,a2,a3,a4,a5,a6 = ListNode.new(0),ListNode.new(1),ListNode.new(2),ListNode.new(3),ListNode.new(4),ListNode.new(5),ListNode.new(6),ListNode.new(7)
a0.next = a1
a1.next = a2
a2.next = a3
a3.next = a4
a4.next = a5
a5.next = a6
