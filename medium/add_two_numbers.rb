# You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
# 
# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8


# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

l1 = ListNode.new(2)
l2 = ListNode.new(4)
l3 = ListNode.new(3)
l1.next = l2
l2.next = l3
a1 = ListNode.new(5)
a2 = ListNode.new(6)
a3 = ListNode.new(4)
a1.next=a2
a2.next=a3
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    
    head = ListNode.new(nil)
    l3=head
    over_flow = 0
    
    while l1 != nil && l2 != nil
      sum = l1.val + l2.val + over_flow
      l3.next = ListNode.new(sum%10)
      over_flow = sum/10
      l3 = l3.next
      l1 = l1.next
      l2 = l2.next
    end
    
    remaining_list = l1.nil? ? l2 : l1
    
    l3.next
    while remaining_list != nil
      sum = remaining_list.val + over_flow
      l3.next = ListNode.new(sum%10)
      over_flow = sum/10
      remaining_list = remaining_list.next
      l3 = l3.next
    end
    
    if over_flow > 0
      l3.next = ListNode.new(1)
    end
    head.next
end
