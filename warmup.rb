def my_reverse(string)
  len = string.length
  chars = string.chars
  output = []

  len.downto(0) { |index| output << chars[index] }

  output.join
end
