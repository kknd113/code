# Determine if a string has all unique characters
# What if no extra memory/data-structure is allowed?

# V1: Using Hashtable
# O(n) time
# O(n) space
def is_uniq_ht(s)
  ht = Hash.new(nil)
  s.each_char do |ch|
    return false if ht[ch]
    ht[ch] = 1
  end
  return true
end


# V2: Sort then Iterate
# O(n logn) time
# O(1) space
def is_uniq_sort(s)
  s=s.chars.sort
  (0...s.count-1).each do |i|
    return false if s[i] == s[i+1]
  end
  return true
end

# V3: Using bit array
# O(n) time
# O(1) space
def is_uniq_bit(s)
  mask = 0
  s.chars.each do |ch|
    return false if (mask & (1 << ch.ord)) > 0
    mask |= (1 << ch.ord) #turn on bit
  end
  return true
end