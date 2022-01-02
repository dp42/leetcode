# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  substr = []
  currsubstr = []
  prev = nil

  s.split(//).each do |char|
    currsubstr = [] if char == prev
    currsubstr.slice!(0..currsubstr.index(char)) if currsubstr.index(char)
    prev = char
    currsubstr << char
    substr = currsubstr.dup if currsubstr.length > substr.length
  end

  substr.size
end
