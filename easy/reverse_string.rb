# @param {String} s
# @return {String}
def reverse_string_easy(s)
    s.reverse
end

def reverse_string(s)
  len = s.length
  
  (0...len/2).each do |i|
    temp = s[i]
    s[i] = s[len-i-1]
    s[len-i] = temp
  end
  s
end
