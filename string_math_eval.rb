
def find_highest_operator(nums)
  ['*', '/', '+', '-'].each do |op|
    return nums.index(op) if nums.include? op
  end
end

def single_eval(x, op, y)
  operators = {
    '*' => lambda { |x,y| x * y },
    '/' => lambda { |x,y| x / y },
    '+' => lambda { |x,y| x + y },
    '-' => lambda { |x,y| x - y }
  }

  operators[op].call(x.to_i,y.to_i)
end

def evall(exp)
  nums = exp.split(' ')

  while nums.count > 1
    op_index = find_highest_operator(nums)
    # puts nums.class
    # puts "#{nums}"
    new_val = single_eval(nums[op_index-1], nums[op_index], nums[op_index+1]).to_s
    nums.delete_at(op_index + 1)
    nums.delete_at(op_index)
    nums.delete_at(op_index - 1)
    nums.insert(op_index - 1, new_val)
  end
  return nums[0]
end
