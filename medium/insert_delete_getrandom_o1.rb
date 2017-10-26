# Design a data structure that supports all following operations in average O(1) time.
# 
# insert(val): Inserts an item val to the set if not already present.
# remove(val): Removes an item val from the set if present.
# getRandom: Returns a random element from current set of elements. Each element must have the same probability of being returned.
# Example:
# 
# // Init an empty set.
# RandomizedSet randomSet = new RandomizedSet();
# 
# // Inserts 1 to the set. Returns true as 1 was inserted successfully.
# randomSet.insert(1);
# 
# // Returns false as 2 does not exist in the set.
# randomSet.remove(2);
# 
# // Inserts 2 to the set, returns true. Set now contains [1,2].
# randomSet.insert(2);
# 
# // getRandom should return either 1 or 2 randomly.
# randomSet.getRandom();
# 
# // Removes 1 from the set, returns true. Set now contains [2].
# randomSet.remove(1);
# 
# // 2 was already in the set, so return false.
# randomSet.insert(2);
# 
# // Since 2 is the only number in the set, getRandom always return 2.
# randomSet.getRandom();


#!!!!!!! You can achieve O(1) Insert and O(1) remove just by using Hash!!!!!!!
#!!!!!!! But using Hash can't give O(1) getRandom                      !!!!!!!
#!!!!!!!                                                               !!!!!!!   
#!!!!!!! In order to get O(1) getRandom, keep the list of numbers so far.  !!!
#!!!!!!! When the number gets removed, switch it with the last entry,  !!!!!!!
#!!!!!!! then just pop it off!                                         !!!!!!!
class RandomizedSet

=begin
    Initialize your data structure here.
=end
    def initialize()
      @dict = Hash.new()
      @nums = []
    end


=begin
    Inserts a value to the set. Returns true if the set did not already contain the specified element.
    :type val: Integer
    :rtype: Boolean
=end
    def insert(val)
        if @dict[val].nil?
          @nums.push(val)
          @dict[val] = @nums.count - 1
          return true
        end
        return false
    end


=begin
    Removes a value from the set. Returns true if the set contained the specified element.
    :type val: Integer
    :rtype: Boolean
=end
    def remove(val)
      unless @dict[val].nil?
        location = @dict[val]
        
        if location != @nums.count - 1
          last_num = @nums[@nums.count - 1]
          @nums[location] = last_num
          @dict[last_num] = location
        end
        @nums.pop
        @dict[val] = nil
        return true
      end
      return false 
    end


=begin
    Get a random element from the set.
    :rtype: Integer
=end
    def get_random()
      @nums.sample  
    end


end

# Your RandomizedSet object will be instantiated and called as such:
# obj = RandomizedSet.new()
# param_1 = obj.insert(val)
# param_2 = obj.remove(val)
# param_3 = obj.get_random()