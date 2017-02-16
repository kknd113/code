# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key,value)

class Node
  attr_accessor :val, :next, :prev
  
  def initialize(val, next_node=nil, prev_node=nil)
    @val = val
    @next = next_node
    @prev = prev_node
  end
end

class LinkedList
  attr_accessor :head, :tail
  
  def initialize(node=nil)
    @head = node
    @tail = node
  end
  
  def print
    result = ""
    n = @head
    while !n.nil?
      result += "#{n.val} ->"
      n = n.next
    end
    result
  end
  
  def append(node)
    @head = node if @tail.nil? || @head.nil?
    node.prev = @tail
    @tail.next = node if !tail.nil?
    @tail = node
  end
  
  def move_head
    if !head.nil?
      n = @head
      @head = @head.next
      n.next = nil
      n.prev = nil
      @head.prev = nil if !head.nil?
    end
  end
  
  def move_to_tail(node)
    return if @tail == node
    
    if @head == node
      @head = node.next
      @head.prev = nil
      node.next = nil
      node.prev = nil
    else
      node.prev.next = node.next
      node.next.prev = node.prev
      node.next = nil
      node.prev = nil
    end
    
    @tail.next = node
    node.prev = @tail
    @tail = node
  end
end