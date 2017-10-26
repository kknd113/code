# Write a function that, given a list of integers (both positive and negative)
# returns the sum of the contiguous subsequence with maximum sum.
# Thus, given the sequence (1, 2, -4, 1, 3, -2, 3, -1) it should return 5.

def largest_subsequence_sum(arr)
  #result[i] = sum of the constiguous subsequence with maximum sum for array[0...i]
  result = Array.new(arr.count, 0)

  (0 ... arr.count).each do |i|
    prev_result = i > 0 ? result[i-1] : 0
    result[i] = [prev_result + arr[i], arr[i]].max
  end
  
  result.max
end