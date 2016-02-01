# Merge two sorted linked lists and return it as a new list. 
# The new list should be made by splicing together the nodes of the first two lists.

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  if l1.nil? || l2.nil?
    return nil if l1.nil? && l2.nil?
    return l2 if l1.nil?
    return l1 if l2.nil?
  end
    
    val1 = l1.val
    val2 = l2.val
    if val1 < val2
      head = l1
      l1=l1.next
    else
      head = l2
      l2=l2.next
    end
    
    pointer = head
    while l1 && l2
      val1 = l1.val
      val2 = l2.val
      if val1 < val2
        pointer.next = l1
        l1=l1.next
      else
        pointer.next = l2
        l2=l2.next
      end
      pointer = pointer.next
    end
    
    pointer.next = l1.nil? ? l2 : l1
    head
end
