# There are N students in a class. Some of them are friends, while some are not. Their friendship is transitive in nature. For example, if A is a direct friend of B, and B is a direct friend of C, then A is an indirect friend of C. And we defined a friend circle is a group of students who are direct or indirect friends.
# 
# Given a N*N matrix M representing the friend relationship between students in the class. If M[i][j] = 1, then the ith and jth students are direct friends with each other, otherwise not. And you have to output the total number of friend circles among all the students.
# 
# Example 1:
# Input: 
# [[1,1,0],
#  [1,1,0],
#  [0,0,1]]
# Output: 2
# Explanation:The 0th and 1st students are direct friends, so they are in a friend circle. 
# The 2nd student himself is in a friend circle. So return 2.
# Example 2:
# Input: 
# [[1,1,0],
#  [1,1,1],
#  [0,1,1]]
# Output: 1
# Explanation:The 0th and 1st students are direct friends, the 1st and 2nd students are direct friends, 
# so the 0th and 2nd students are indirect friends. All of them are in the same friend circle, so return 1.
# Note:
# N is in range [1,200].
# M[i][i] = 1 for all students.
# If M[i][j] = 1, then M[j][i] = 1.
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


def find_circle_num(m)
  uf = UnionFind.new(m.length)
  (0 ... m.length - 1).each do |i|
    (i + 1 ... m.length).each do |j|
      uf.union(i,j) if m[i][j] == 1
    end
  end
  uf.count
end

# @param {Integer[][]} m
# @return {Integer}
def find_circle_num_dfs(m)
  visited = Array.new
  count = 0
  (0 ... m.length).each do |i|
    if !visited[i]
      dfs(m, visited, i)
      count += 1
    end
  end
  return count
end

visited = Array.new()
m = [[1,1,0],
     [1,1,0],
     [0,0,1]]
def dfs(m, visited, i)
  (0 ... m.length).each do |j|
    if (m[i][j] == 1 && !visited[j])
      visited[j] = true
      dfs(m,visited,j)
    end
  end
end