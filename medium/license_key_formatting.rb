# @param {String} s
# @param {Integer} k
# @return {String}

def license_key_formatting(s, k)
  s = s.gsub('-','').upcase
  head_len = s.length % k
  
  index = head_len
  new_s = s[0...head_len] + '-'
  while index < s.length
    new_s << s[index...index+k]
    new_s << '-'
    index+=k
  end
  
  new_s[new_s.length-1] = '' if new_s[new_s.length-1] == '-'
  new_s[0] = '' if new_s[0] == '-'
  new_s
end