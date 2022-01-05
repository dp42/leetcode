# @param {String} s @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  return s if num_rows == 1

  result = ''
  slen = s.length
  clen = 2 * num_rows - 2

  num_rows.times do |i|
    j = 0
    while i + j < slen
      result << s[i + j]
      result << s[j + clen - i] if i != 0 && i != num_rows - 1 && j + clen - i < slen
      j += clen
    end
  end
  result
end
