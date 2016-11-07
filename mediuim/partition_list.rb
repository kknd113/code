# Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.
#
# You should preserve the original relative order of the nodes in each of the two partitions.
#
# For example,
# Given 1->4->3->2->5->2 and x = 3,
# return 1->2->2->4->3->5.
#

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

head = ListNode.new(1)
head.next = ListNode.new(4)
head.next.next = ListNode.new(3)
head.next.next.next = ListNode.new(2)
head.next.next.next.next = ListNode.new(5)
head.next.next.next.next.next = ListNode.new(2)

# For example,
# Given 1->4->3->2->5->2 and x = 3,
# return 1->2->2->4->3->5.
#

# @param {ListNode} head
# @param {Integer} x
# @return {ListNode}
def partition(head, x)
  return head if head.nil? || head.next.nil?
  small, big = nil, nil
  small_p, big_p = nil, nil
  while head
    val = head.val
    if val < x
      if small.nil?
        small = head
        small_p = small
      else
        small.next = head
        small = small.next
      end
    else
      if big.nil?
        big = head
        big_p = big
      else
        big.next = head
        big = big.next
      end
    end
    head = head.next
  end

  if small && small.next
    small.next = nil
  elsif big && big.next
    big.next = nil
  end

  if small
    small.next = big_p
  else
    return big_p
  end
  small_p
end

def print_list(head)
  cur = head
  result = ""
  while cur
    result << " -> #{cur.val}"
    cur = cur.next
  end
end
partition(head,3)
