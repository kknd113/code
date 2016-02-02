# Reverse a singly linked list.
# 
# click to show more hints.
# 
# Hint:
# A linked list can be reversed either iteratively or recursively. Could you implement both?
# 
# Subscribe to see which companies asked this question

Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end


def reverse_list(head)
  return head if head.nil? || head.next.nil?
  
  prev, current = nil, head
  
  while current
    next_node = current.next
    current.next = prev
    prev = current
    current = next_node
  end
  prev
end
    
end
# @param {ListNode} head
# @return {ListNode}
def reverse_list_inefficient(head)
    stack = list_to_stack(head)
    new_head = ListNode.new(stack.pop)
    c = new_head
    
    stack.length.times do
      c.next = ListNode.new(stack.pop)
      c = c.next
    end
    new_head
end

def list_to_stack(head)
  stack = []
  while head
    stack.push(head.val)
    head = head.next
  end
  stack
end


def reverse_list_recursive(head)
  return head if head.nil? || head.next.nil?
  
end
