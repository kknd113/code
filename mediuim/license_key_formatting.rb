# @param {String} s
# @param {Integer} k
# @return {String}
def license_key_formatting(s, k)
  s.gsub!('-','')
  head_len = s.length % k
  
  puts s
  puts head_len
  
  index = head_len
  new_s = s[0...head_len]
  while index < s.length
    new_s << s[index...index+4].map(&upcase)
    new_s << '-'
    index+=4
  end
  
  new_s[new_s.length-1] = '' if new_s[new_s.length-1] == '-'
  new_s
end