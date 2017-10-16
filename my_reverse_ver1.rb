def my_reverse(str)
  arr = []
  str.each_char{|char| arr.unshift(char) }
  arr.join("")
end