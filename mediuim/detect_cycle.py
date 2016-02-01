# Given a linked list, determine if it has a cycle in it.
# 
# Follow up:
# Can you solve it without using extra space?

# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def hasCycle(self, head):
        """
        :type head: ListNode
        :rtype: bool
        """
        if head == None or head.next == None:
            return False
    
        slow_node = head
        fast_node = head.next
        
        while slow_node and fast_node and fast_node.next:
            if slow_node == fast_node:
                return True
            slow_node = slow_node.next
            fast_node = fast_node.next.next
        return False
            
        
