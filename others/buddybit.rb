# Given a complete binary tree with nodes of values of either 1 or 0, the following rules always hold:
# (1) a node's value is 1 if and only if all its subtree nodes' values are 1
# (2) a leaf node can have value either 1 or 0
# Implement the following 2 APIs:
# set_bit(offset, length), set the bits at range from offset to offset+length-1
# clear_bit(offset, length), clear the bits at range from offset to offset+length-1
# 
# i.e. The tree is like:
#              0
#           /     \
#          0        1
#        /  \      /  \
#       1    0    1    1
#      /\   / \   / 
#     1  1 1   0 1
#     Since it's complete binary tree, the nodes can be stored in an array:
#     [0,0,1,1,0,1,1,1,1,1,0,1] 

def set_bit_decendants(arr, x)
  return if x >= arr.count
  l_child_index, r_child_index = [2*x+1, 2*x+2]
  
  if l_child_index < arr.count && arr[l_child_index] != 1
    arr[l_child_index] = 1
    set_bit_decendants(arr, l_child_index)
  end
  
  if r_child_index < arr.count && arr[r_child_index] != 1
    arr[r_child_index] = 1
    set_bit_decendants(arr, r_child_index)
  end
end

def set_bit_ancestors(arr, x)
  return if x <= 0 || x >= arr.count
  l_child, r_child = [x%2==1, x%2==0]
  
  if (l_child && x+1 < arr.count && arr[x+1] == 1) ||
     (r_child && x-1 > 0 && arr[x-1] == 1)
     arr[(x-1)/2] = 1
   end
  set_bit_ancestors(arr, (x-1)/2)
end

def set_bit(arr, pos, len)
  return if arr.nil? || arr.empty? || pos < 0 || len <=0
  
  (pos ... [arr.count, pos+len].min).each do |i|
    # set current index
    arr[i] == 1 ? next : arr[i] = 1 
    
    # set decendants
    set_bit_decendants(arr, i)
    
    # set ancestors
    set_bit_ancestors(arr, i)
  end
end

def unset_bit_ancestors(arr, x)
  return if x <= 0 || arr[(x-1)/2] == 0
  arr[(x-1)/2] = 0
  unset_bit_ancestors(arr, (x-1)/2)
end

def unset_bit_decendants(arr, x)
  return if x < 0 || x >= arr.count
  l_child_index = 2*x+1
  if l_child_index < arr.count && arr[l_child_index] == 1
    arr[l_child_index] = 0
    unset_bit_decendants(arr,l_child_index)
  else
    return
  end
end

def clear_bit(arr, pos, len)
  return if arr.nil? || arr.empty? || pos < 0 || len <= 0
  
  (pos ... [arr.count, pos+len].min).each do |i|
    next if arr[i] == 0
    
    # Unset current index
    arr[i] = 0
    
    # Unset ancestors
    unset_bit_ancestors(arr, i)
    
    # Unset decendants
    unset_bit_decendants(arr, i)
  end
end

arr=[0,0,1,1,0,1,1,1,1,1,0,1]

test_cases=[]
(0 ... arr.count).each do |i|
  (1 ... arr.count-i+1).each do |j|
    test_cases << [i,j]
  end
end

test_cases.each do |test_case|
  pos, length = test_case
  arr=[0,0,1,1,0,1,1,1,1,1,0,1]
  set_bit(arr,pos,length)
  puts "after setting bit from #{pos} for #{length} A is:  #{arr}"
  arr=[0,0,1,1,0,1,1,1,1,1,0,1]
  clear_bit(arr, pos, length)
  puts "after clearing bit from #{pos} for #{length} A is:  #{arr}"
end