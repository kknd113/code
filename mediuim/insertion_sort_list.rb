# Sort a linked list using insertion sort.

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# 2 -> 1
#      c   p=dummy, next_node = nil
# dummy -> 2 -> nil
# 
#      c    n
# 5 -> 3 -> 7
# dummy -> 3 ->5 -> nil

# 5 -> 1 -> 9 -> 7
# i    j
# p.next = 5 -> nil      1 -> 9 -> 7
#                        i    j
# p.next = 1 -> 5        9 -> 7
#               p
#                 9 -> nil
def insertion_sort_list(head)
  return head if head.nil? || head.next.nil?
  
  dummy = ListNode.new
  i = head
  
  while i
    j = i.next
    p = dummy
    
    while p.next && i.val > p.next.val
      p = p.next
    end
    i.next = p.next
    p.next = i
    i = j
  end
  dummy.next
end
















def insertion_sort
  return head if head.nil? || head.next.nil?
    dummy = Node.new
    c = head
    while c
      next_node = c.next
      p = dummy unless p && p.next.key <= c.key # You don't have to move p to the head at each time
      while p.next && p.next.key < c.key
        p = p.next
      end
      c.next = p.next
      p.next = c
      c = next_node
    end
    dummy.next
  end
end




# @param {ListNode} head
# @return {ListNode}
def insertion_sort_list(head)
    return head if head.nil? || head.next.nil?
    
    new_head = ListNode.new(head.val)
    head = head.next
    
    while head
      puts head.val
      new_head = sorted_insert(new_head, ListNode.new(head.val))
      head = head.next
    end
    new_head    
end

def sorted_insert(head, node)
  pt = head
  prev = nil
  
  while pt && node.val > pt.val
    prev = pt
    pt = pt.next
  end
  
  if prev
    prev.next = node
    node.next = pt
    head
  else
    node.next = pt
    node
  end
end

def insertion_sort(arr)
  return arr if arr.count < 2
  
  (1...arr.count).each do |j|
    val = arr[j]
    i = j - 1
    while i >= 0 && val < arr[i]
      arr[i+1] = arr[i]
      i -= 1
    end
    arr[i+1] = val
  end
  arr
end

a1 = ListNode.new(2)
a2 = ListNode.new(4)
a3 = ListNode.new(9)
a4 = ListNode.new(17)
aa = ListNode.new(1)
a1.next=a2
a2.next=a3
a3.next=a4
