# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @param {Integer} d
# @param {Integer} e
# @param {Integer} f
# @param {Integer} g
# @param {Integer} h
# @return {Integer}
def compute_area(a, b, c, d, e, f, g, h)
  r1_area = (c-a) * (d-b)
  r2_area = (g-e) * (h-f)

  i,j = [a,e].max, [b,f].max
  k,l = [c,g].min, [d,h].min
  r3_area = ((i > k) || (j > l)) ? 0 : (k-i) * (l-j)
  r1_area + r2_area - r3_area
end
