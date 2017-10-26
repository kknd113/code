# Reverse a linked list from position m to n. Do it in-place and in one-pass.
# 
# For example:
# Given 1->2->3->4->5->NULL, m = 2 and n = 4,
# 
# return 1->4->3->2->5->NULL.
# 
# Note:
# Given m, n satisfy the following condition:
# 1 ≤ m ≤ n ≤ length of list.

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @param {Integer} m
# @param {Integer} n
# @return {ListNode}
def reverse_between(head, m, n)
    return head if n-m <= 0 || head.nil? || head.next.nil?
    counter = 1
    i = head
    prev = nil
    while counter < m
      prev = i
      i = i.next
      counter += 1
    end
    
    if m != 1
      prev.next = reverse_k(i,n-m+1)
      head
    else
      reverse_k(i,n-m+1)
    end
end

# a1 = ListNode.new(1)
# a2 = ListNode.new(2)
# a3 = ListNode.new(3)
# a4 = ListNode.new(4)
# a5 = ListNode.new(5)
# a1.next = a2
# a2.next = a3
# a3.next = a4
# a4.next = a5

def reverse_k(head, k)
  tail = head
  i = head
  prev = nil
  counter = 0
  
  while i && counter < k
    j = i.next
    i.next = prev
    prev = i
    i = j
    counter += 1
  end
  tail.next = i
  prev
end
