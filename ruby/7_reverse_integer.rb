# @param {Integer} x
# @return {Integer}
def reverse(x)
  reversed = 0

  if x >= 0
    decimax = (2**31 - 1) / 10
    while x != 0
      pop = x % 10
      return 0 if reversed > decimax || (reversed == decimax && pop > 7)

      reversed = reversed * 10 + pop
      x /= 10
    end
  else
    absdecimin = 2**31 / 10
    abs = x.abs
    while abs != 0
      pop = abs % 10
      return 0 if reversed > absdecimin || (reversed == absdecimin && pop > 8)

      reversed = reversed * 10 + pop
      abs /= 10
    end
    reversed *= -1
  end
  reversed
end
