require 'benchmark'

# @param {String} s
# @return {String}
def longest_palindrome(s)

  return s if s == s.reverse
  return s if s.length < 2

  chars = {}
  last_idx = s.length - 1
  start = 0
  maxlen = 1

  searched = Array.new(s.length) { Array.new(s.length, false) }

  i = last_idx
  while i >= 0
    chars[i] = s[i]
    searched[i][i] = true
    searched[i][i + 1] = (s[i] == s[i + 1])

    if s[i] == s[i + 1]
      searched[i][i + 1] = true
      start = i
      maxlen = 2
    end
    i -= 1
  end

  i = last_idx
  while i >= 0
    j = last_idx
    while j >= 0
      break if i > j

      if i == j || j - i == 1
        j -= 1
        next
      end

      searched[i][j] = (chars[i] == chars[j] && searched[i + 1][j - 1])
      if searched[i][j] && j - i + 1 > maxlen
        maxlen = j - i + 1
        start = i
      end
      j -= 1
    end

    i -= 1
  end

  s[start, maxlen]
end

str = "ukxidnpsdfwieixhjnannbmtppviyppjgbsludrzdleeiydzawnfmiiztsjqqqnthwinsqnrhfjxtklvbozkaeetmblqbxbugxycrlzizthtuwxlmgfjokhqjyukrftvfwikxlptydybmmzdhworzlaeztwsjyqnshggxdsjrzazphugckgykzhqkdrleaueuajjdpgagwtueoyfdafacvadfafafdafadfafdccccccferererereedfacccccfdjkafjalkdfjeifjkfjdaklfjdakslfjakldfjieybzanrvrgevolwssvqimgzpkxehnunycmlnetfaflhusauopyizbcpntywntadciopspgyhkelxgwplvncmvncmvncdjjdjfdhjfhdjfhdjfdizyszcwdixzgxzgxiawstbnpjezxinyowmqsysazgwxpthloegxvezsxcvorzquzdtfcvckjpewowazuaynfpxsxrihsfswrmuvluwbdazmcealapulnahgdxxycizeqelesvshkgpavihywwlhdfopmmbwegibxhluantulnccqieyrbjjqtlgkpfezpxmlwpyohdyftzgbeoioquxpnrwrgzlhtlgyfwxtqcgkzcuuwagmlvgiwrhnredtulxudrmepbunyamssrfwyvgabbcfzzjayccvvwxzbfgeglqmuogqmhkjebehtwnmxotjwjszvrvpfpafwomlyqsgnysydfdlbbltlwugtapwgfnsiqxcnmdlrxoodkhaaaiioqglgeyuxqefdxbqbgbltrxcnihfwnzevvtkkvtejtecqyhqwjnnwfrzptzhdnmvsjnnsnixovnotugpzuymkjplctzqbfkdbeinvtgdpcbvzrmxdqthgorpaimpsaenmnyuyoqjqqrtcwiejutafyqmfauufwripmpcoknzyphratopyuadgsfrsrqkfwkdlvuzyepsiolpxkbijqw"

Benchmark.bm(10) do |b|
  b.report 'Benchmark' do
    pp longest_palindrome str
  end
end
