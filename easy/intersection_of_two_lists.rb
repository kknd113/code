# Write a program to find the node at which the intersection of two singly linked lists begins.
# 
# 
# For example, the following two linked lists:
# 
# A:          a1 → a2
#                    ↘
#                      c1 → c2 → c3
#                    ↗            
# B:     b1 → b2 → b3
# begin to intersect at node c1.
# 
# Notes:
# 
# If the two linked lists have no intersection at all, return null.
# The linked lists must retain their original structure after the function returns.
# You may assume there are no cycles anywhere in the entire linked structure.
# Your code should preferably run in O(n) time and use only O(1) memory.

class Solution(object):
    def getIntersectionNode(self, headA, headB):
        """
        :type head1, head1: ListNode
        :rtype: ListNode
        """
        
        if headA == None or headB == None:
          return None
        #Make cycle
        t = headA
        while t.next:
          t=t.next
        t.next = headA
        
        result =  self.detectCycle(headB)
        t.next = None
        return result
        
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
