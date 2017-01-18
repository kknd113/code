# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
    return false if n < 0
    n.to_s(2).split('').reject{ |i| i != '1' }.count == 1
end
