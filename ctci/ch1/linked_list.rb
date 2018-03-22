class Node
  attr_accessor :val, :next, :prev
  def initialize(value)
    @val = value
    @next, @prev = nil, nil
  end
end

#double linked list
class LinkedList
  attr_accessor :head, :tail
  
  def initialize
    @head = nil
  end
  
  def insert(value)
    n = Node.new(value)
    if @head
      n.next = @head
      @head.prev = n
      @head = n
    else
      @head = n
    end
  end
  
  def find(value)
    n = @head
    while n
      return n if n.val == value
      n = n.next
    end
  end
  
  def remove(value)
    node = find(value)
    return unless node
    p,n = node.prev, node.next
    p.next = n if p
    n.prev = p if n
    @head = n if @head == node
  end
  
  def print
    n = @head
    str = ""
    while n
      puts n.val
      str << " #{n.val} <->"
      n = n.next
    end
    str
  end
end