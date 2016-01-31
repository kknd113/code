# Write a function to delete a node (except the tail) in a singly linked list, given only access to that node.
# 
# Supposed the linked list is 1 -> 2 -> 3 -> 4 and you are given the third node with value 3, the linked list should become 1 -> 2 -> 4 after calling your function.
# 


# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

l1 = ListNode.new(1)
l2 = ListNode.new(2)
l3 = ListNode.new(3)
l4 = ListNode.new(4)
l5 = ListNode.new(5)
l1.next=l2
l2.next=l3
l3.next=l4
l4.next=l5
# @param {ListNode} node
# @return {Void} Do not return anything, modify node in-place instead.
def delete_node(node)
  next_node = node.next
  node.val = next_node.val
  node.next = next_node.next
end
