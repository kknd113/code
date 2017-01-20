# Given an array of integers, find if the array contains any duplicates. Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
#
# Subscribe to see which companies asked this question

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  return false if nums.count < 2
  hash = Hash.new

  nums.each do |n|
    return true unless hash[n].nil?
    hash[n] = 1
  end
  return false
end

def contains_duplicate_naive(nums)
    nums.uniq.count != nums.count
end
