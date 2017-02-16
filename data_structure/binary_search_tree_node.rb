class BinarySearchTreeNode
  attr_accessor :key, :left, :right, :parent

  def initialize(key)
    @key = key
    @left = nil
    @right = nil
    @parent = nil
  end

  def insert_left(key)
    @left = BinarySearchTreeNode.new(key)
    @left.parent = self
  end

  def insert_right(key)
    @right = BinarySearchTreeNode.new(key)
    @right.parent = self
  end

  def insert(key)
    if key <= @key
      @left.nil? ? self.insert_left(key) : @left.insert(key)
    else
      @right.nil? ? self.insert_right(key) : @right.insert(key)
    end
  end

  def to_s
    "#{@key}"
  end
end
