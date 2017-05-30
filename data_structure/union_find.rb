class UnionFind
  attr_accessor :nodes, :count
  
  def initialize(num)
    @nodes = []
    @count = num
    num.times do |n|
        nodes[n] = n
    end
  end
  
  def root(i)
    while nodes[i] != i
      i = nodes[i]
    end
    i
  end
  
  def connected?(i,j)
    root(i) == root(j)
  end
  
  def union(i,j)
    return if connected?(i,j)
    nodes[j] = nodes[i]
    @count -= 1
  end
end