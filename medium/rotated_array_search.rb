# Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
# 
# (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
# 
# You are given a target value to search. If found in the array return its index, otherwise return -1.
# 
# You may assume no duplicate exists in the array.


# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  return -1 if nums.count < 1
  i,j = 0, nums.count-1
  
  while (i <= j)
    m = (i+j)/2
    head,mid,tail = nums[i], nums[m], nums[j]
    return target if mid == target
    
    if mid > head #left section is sorted
      if target < mid && target > head
        j = m - 1
      else
        i = m + 1
      end
    end
    
    if mid < tail #right section is sorted
      if target > mid && target < tail
        i = m + 1
      else
        j = m - 1
      end
    end
  end
  return -1  
end