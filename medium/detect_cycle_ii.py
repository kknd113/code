# Given a linked list, return the node where the cycle begins. If there is no cycle, return null.
# 
# Note: Do not modify the linked list.
# 
# Follow up:
# Can you solve it without using extra space?

# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def detectCycle(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        slow = head
        fast = head
        detected = False
        
        while slow and fast and fast.next:
            if detected:
                if slow == fast:
                    return slow
                slow = slow.next
                fast = fast.next
            else:
                slow = slow.next
                fast = fast.next.next
                
                if slow == fast: #Cycle detected
                    slow = head
                    detected = True
                
                
        
        
        return None
