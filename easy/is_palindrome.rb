# Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
#
# For example,
# "A man, a plan, a canal: Panama" is a palindrome.
# "race a car" is not a palindrome.
#
# Note:
# Have you consider that the string might be empty? This is a good question to ask during an interview.
#
# For the purpose of this problem, we define empty string as valid palindrome.
#

def is_palindrome(s)
  s.palindrome?
end

class String
  def palindrome?
    letters = self.downcase.scan(/\w/)
    letters == letters.reverse
  end
end

def is_palindrome_slower(s)
  s = s.split('')
  l,r = 0, s.length-1

  while l < r
    while l < r && !!s[l].alpha?
      l += 1
    end

    while l < r && !!s[r].alpha?
      r -= 1
    end

    if s[l] != s[r]
      return false
    end
    l+=1
    r-=1
  end
  return true
end

# @param {String} s
# @return {Boolean}
def is_palindrome_slow(s)
  s = s.alphanumericalized
  s.reverse == s
end

class String
  def alpha?
    !!match(/^[[:alnum:]]+$/)
  end

  def alphanumericalized
    arr = []
    self.split('').each do |char|
      arr << char if char.alpha?
    end
    arr.join('').downcase
  end
end
