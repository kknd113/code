# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  done = false
  index = digits.count - 1
  
  while index >= 0 && !done
    if digits[index] + 1 == 10
      digits[index] = 0
      done = false
    else
      digits[index] = digits[index] + 1
      done = true
    end
    index -= 1
  end
  
  index < 0 && !done ? [1] + digits : digits
end