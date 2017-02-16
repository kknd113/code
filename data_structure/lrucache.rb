class Node
  attr_accessor :key, :val, :next, :prev
  
  def initialize(key, val, next_node=nil, prev_node=nil)
    @key = key
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
      result += "#{n.val} -> "
      n = n.next
    end
    result
  end
  
  def append(node)
    @head = node if @tail.nil? || @head.nil?
    node.prev = @tail
    @tail.next = node unless @tail.nil?
    @tail = node
  end
  
  def remove_head
    unless @head.nil?
      n = @head
      @head = n.next
      @head.prev = nil unless @head.nil?
      n.next = nil
    end
  end
  
  def move_to_tail(node)
    return if node == @tail
    
    if node == @head
      @head = node.next
      @head.prev = nil
    else
      node.prev.next = node.next
      node.next.prev = node.prev
    end
    node.next = nil
    node.prev = @tail
    @tail.next = node
    @tail = node
  end
end

class LRUCache
  attr_accessor :size, :max_size, :list, :dict

  def initialize(capacity)
    #puts "capacity: #{capacity}"
    @size, @max_size = 0, capacity
    @list = LinkedList.new
    @dict = Hash.new(nil)
  end

  def get(key)
    result = @dict[key]
    return -1 if result.nil?
    @list.move_to_tail(result)
    # puts "getting key: #{key}"
    # puts @list.print
    # @list.print
    return result.val
  end

  def put(key, val)
    result = @dict[key]
    if result
      result.val = val
      @list.move_to_tail(result)
    else
      node = Node.new(key,val)
      if @dict.size >= @max_size
        @dict.delete(@list.head.key)
        @list.remove_head
        @list.append(node)
      else
        @list.append(node)
      end
      @dict[key] = node
    end
  end
end
