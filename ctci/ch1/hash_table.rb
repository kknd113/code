class Node
  attr_accessor :key, :val, :next, :prev
  def initialize(key, value)
    @key, @val = key, value
    @next, @prev = nil, nil
  end
end

#double linked list
class LinkedList
  attr_accessor :head, :tail
  
  def initialize
    @head = nil
  end
  
  def insert(key, value)
    n = Node.new(key, value)
    if @head
      n.next = @head
      @head.prev = n
      @head = n
    else
      @head = n
    end
  end
  
  def find(key)
    n = @head
    while n
      return n if n.key == key
      n = n.next
    end
  end
  
  def remove(key)
    node = find(key)
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
      str << " (#{n.key},#{n.val}) <->"
      n = n.next
    end
    str
  end
end

# Array implementation
class HashTable
  attr_accessor :arr
  
  def initialize(size)
    @size = size
    @arr = Array.new(size, LinkedList.new)
  end
  
  def insert(key, val)
    index = hash(key) % @size
    l = @arr[index]
    n = l.find(key)
    
    if n
      n.val = val
    else
      l.insert(key, val)
    end
  end
  
  def get(key)
    index = hash(key) % @size
    l = @arr[index]
    l.find(key).val
  end
  
  def hash(obj)
    obj.hash
  end
end