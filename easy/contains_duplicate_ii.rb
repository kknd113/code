# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
    len = nums.length
    return false if  len < 2
    
    dict = Hash.new(nil)
    
    (0...len).each do |i|
        val = nums[i]
        if dict[val].nil?
            dict[val] = i
        elsif i - dict[val] <= k
            return true
        elsif i > dict[val]
            dict[val] = i
        end
    end
    return false
end
