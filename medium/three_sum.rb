# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
   nums.sort!
   len = nums.count
   results = []
   nums.each_with_index do |num, i|
     twosums = two_sum(nums[i+1..len], 0-num)
     if twosums.any?
       twosums.map! do |elem|
         results << [num] + elem
       end
     end
   end
   results.uniq
end


[-4,-1,-1,0,1,2]
# O(n) assuming nums is sorted
def two_sum(nums, target)

  l,r = 0, nums.count-1

  results = []

  while l < r

    total = nums[l] + nums[r]
    if total == target
      results << [nums[l],nums[r]]
      l,r = l+1, r-1
    elsif total < target
      l += 1
    else
      r -= 1
    end
  end
  results
end
