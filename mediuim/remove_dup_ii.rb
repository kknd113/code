# Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.
# 
# For example,
# Given 1->2->3->3->4->4->5, return 1->2->5.
# Given 1->1->1->2->3, return 2->3.

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end



# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
end

def get_dup_hash(head)
  hash = Hash.new(0)
  while head
    hash[head.val] += 1
    head = head.next
  end
  hash
end
