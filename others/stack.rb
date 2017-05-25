class ArrayStack
  attr_accessor :arr
  
  def initialize(size)
    @arr = Array.new(size)
    @top_index = -1
    @size = size
  end
  
  def push(value)
    raise "Stack is full" if @top_index >= @size-1
    @top_index+=1
    @arr[@top_index] = value
  end
  
  def pop
    if @top_index >= 0
      @top_index-=1
      @arr[@top_index+1]
    else
      raise "Stack is empty"
    end
  end
  
  def top
    @arr[top_index]
  end
end

module LinkedList
  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node)
      @value = value
      @next_node = next_node
    end
  end
  
  class Stack
    
    def initialize
      @top = nil
    end
    
    def push(value)
      @top = Node.new(value, @top)
    end
    
    def pop
      raise "Stack is empty!" if @top.nil?
      result = @top.value
      @top = @top.next_node
      result
    end
  end
end

listStack = LinkedList::Stack.new
listStack.push(5)
listStack.push(4)
listStack.push(3)
listStack.push(2)
listStack.push(1)

arrayStack = ArrayStack.new(5)
arrayStack.push(5)
arrayStack.push(4)
arrayStack.push(3)
arrayStack.push(2)
arrayStack.push(1)
