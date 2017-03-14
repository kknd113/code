# Given a stream of integers and a window size, calculate the moving average of all integers in the sliding window.
# 
# For example,
# MovingAverage m = new MovingAverage(3);
# m.next(1) = 1
# m.next(10) = (1 + 10) / 2
# m.next(3) = (1 + 10 + 3) / 3
# m.next(5) = (10 + 3 + 5) / 3

class MovingAverage
=begin
    Initialize your data structure here.
    :type size: Integer
=end
    def initialize(size)
      @size = size
      @q = Array.new()
    end


=begin
    :type val: Integer
    :rtype: Float
=end
    def next(val)
      @q.shift if @q.count >= @size
      @q.push(val)
      @q.reduce(:+) / @q.count.to_f
    end


end

# Your MovingAverage object will be instantiated and called as such:
# obj = MovingAverage.new(size)
# param_1 = obj.next(val)