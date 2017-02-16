require_relative 'binary_search_tree_node'
require 'test/unit'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  # O(log n)
  def insert(key)
    if @root.nil?
      @root = BinarySearchTreeNode.new(key)
    else
      @root.insert(key)
    end
  end

  # O(log n)
  def find(key)
    n = @root
    while !n.nil?
      if key == n.key
        return n
      elsif key < n.key
        n = n.left
      else
        n = n.right
      end
    end
    return nil
  end

  def find_min
    n = @root
    while !n.nil? && !n.left.nil?
      n = n.left
    end
    n
  end

  def find_max
    n = @root
    while !n.nil? && !n.right.nil?
      n = n.right
    end
    n
  end
end

class BinarySearchTreeTest < Test::Unit::TestCase

  def test_iniit
    t = BinarySearchTree.new
    assert_equal(t.root, nil)
  end

  def test_insert
    t = BinarySearchTree.new
    t.insert(3)
    t.insert(1)
    t.insert(12)
    t.insert(15)
    assert_equal(t.root.key,3)
    assert_equal(t.root.right.right.key, 15)
  end
end




a = BinarySearchTree.new
a.insert(49)
a.insert(79)
a.insert(64)
a.insert(46)
a.insert(41)
