# Given a singly linked list L: L0→L1→…→Ln-1→Ln,
# reorder it to: L0→Ln→L1→Ln-1→L2→Ln-2→…
# 
# You must do this in-place without altering the nodes' values.
# 
# For example,
# Given {1,2,3,4}, reorder it to {1,4,2,3}.
#1,2,3,4,5,6
#[1,2,3]   [6,5,4]
# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end


#Was kind of challenging.
#Algorithm is to:
# 1) Reverse the second half of the linked list
# 2) Iteratively re-arrange, looking at one node from each list
# e.g) [1,2,3,4,5,6,7]
# ->  [1,2,3,4], [7,6,5]
# -> [1,7,2,6,3,5,4]

# @param {ListNode} head
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
    return head if head.nil? || head.next.nil? || head.next.next.nil?
    
    slow = head
    fast = head
    while fast && fast.next
      slow = slow.next
      fast = fast.next.next
    end
    c = slow.next
    slow.next = nil
    second_half_reversed = reverse_list(c)

    first_half = head
    
#               p
# [1,2]        [4,3]
    prev = ListNode.new(nil)

    while first_half && second_half_reversed
      # puts "#{first_half.val}, #{second_half_reversed.val}"
      n = first_half.next
      prev.next = first_half
      first_half.next = second_half_reversed
      prev = second_half_reversed
      first_half = n
      second_half_reversed = second_half_reversed.next
    end
    if first_half
      prev.next = first_half
    end
end

def reverse_list(head)
  return head if head.nil? 
  
  prev, current = nil, head
  
  while current
    next_node = current.next
    current.next = prev
    prev = current
    current = next_node
  end
  prev
end
