# Total Accepted: 178548
# Total Submissions: 547738
# Difficulty: Easy
# Contributors: Admin
# Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
# 
# The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.

# @param {String} s
# @return {Boolean}

def is_valid(s)
    stack = []
    s.split('').each do |char|
      if is_left(char)
        stack.push(char)
      else
        left = stack.pop
        return false if left.nil? || !is_matching(left,char)
      end
    end
    return stack.empty?
end

def is_left(char)
  ['(','[','{'].include? char
end

def is_matching(left, right)
  case right
  when ']'
    return left == '['
  when '}'
    return left == '{'
  when ')'
    return left == '('
  else
    return false
  end
end