require 'benchmark'

# @param {String} s
# @return {String}
def longest_palindrome(s)
  return s if s == s.reverse
  return s if s.length < 2

  slen = s.length
  start = 0
  plen = 1

  i = 0
  while i < slen
    len1 = expand_around_center(i, i, s, slen)
    len2 = expand_around_center(i, i + 1, s, slen)
    len = len1 > len2 ? len1 : len2

    if len > plen
      plen = len
      start = i - (plen - 1) / 2
    end
    i += 1
    # p len2 if len2 > 5
  end
  s[start, plen]
end

def expand_around_center(l, r, s, slen)
  left = l
  right = r

  while left >= 0 && right < slen && s[left] == s[right]
    left -= 1
    right += 1
  end
  right - left - 1
end

str = "ukxidnpsdfwieixhjnannbmtppviyppjgbsludrzdleeiydzawnfmiiztsjqqqnthwinsqnrhfjxtklvbozkaeetmblqbxbugxycrlzizthtuwxlmgfjokhqjyukrftvfwikxlptydybmmzdhworzlaeztwsjyqnshggxdsjrzazphugckgykzhqkdrleaueuajjdpgagwtueoyfdafacvadfafafdafadfafdccccccferererereedfacccccfdjkafjalkdfjeifjkfjdaklfjdakslfjakldfjieybzanrvrgevolwssvqimgzpkxehnunycmlnetfaflhusauopyizbcpntywntadciopspgyhkelxgwplvncmvncmvncdjjdjfdhjfhdjfhdjfdizyszcwdixzgxzgxiawstbnpjezxinyowmqsysazgwxpthloegxvezsxcvorzquzdtfcvckjpewowazuaynfpxsxrihsfswrmuvluwbdazmcealapulnahgdxxycizeqelesvshkgpavihywwlhdfopmmbwegibxhluantulnccqieyrbjjqtlgkpfezpxmlwpyohdyftzgbeoioquxpnrwrgzlhtlgyfwxtqcgkzcuuwagmlvgiwrhnredtulxudrmepbunyamssrfwyvgabbcfzzjayccvvwxzbfgeglqmuogqmhkjebehtwnmxotjwjszvrvpfpafwomlyqsgnysydfdlbbltlwugtapwgfnsiqxcnmdlrxoodkhaaaiioqglgeyuxqefdxbqbgbltrxcnihfwnzevvtkkvtejtecqyhqwjnnwfrzptzhdnmvsjnnsnixovnotugpzuymkjplctzqbfkdbeinvtgdpcbvzrmxdqthgorpaimpsaenmnyuyoqjqqrtcwiejutafyqmfauufwripmpcoknzyphratopyuadgsfrsrqkfwkdlvuzyepsiolpxkbijqw"

Benchmark.bm(10) do |b|
  b.report 'Benchmark' do
    pp longest_palindrome str
  end
end
