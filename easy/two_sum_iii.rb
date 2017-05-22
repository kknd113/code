# Design and implement a TwoSum class. It should support the following operations: add and find.
# 
# add - Add the number to an internal data structure.
# find - Find if there exists any pair of numbers which sum is equal to the value.
# 
# For example,
# add(1); add(3); add(5);
# find(4) -> true
# find(7) -> false

class TwoSum
  attr_accessor :list
=begin
    Initialize your data structure here.
=end
    def initialize()
        @list = []
        @hash = Hash.new([])
    end


=begin
    Add the number to an internal data structure..
    :type number: Integer
    :rtype: Void
=end
    def add(number)
        @list << number
        @hash[number] = @hash[number] + [@list.count - 1]
    end


=begin
    Find if there exists any pair of numbers which sum is equal to the value.
    :type value: Integer
    :rtype: Boolean
=end
    def find(value)
      @hash.each do |k,v|
        if @hash.key?(value-k)
          if value - k == k
            return true if @hash[k].count > 1
          else
            return true
          end
        end
      end
      false
    end
end

# Your TwoSum object will be instantiated and called as such:
# obj = TwoSum.new()
# obj.add(number)
# param_2 = obj.find(value)