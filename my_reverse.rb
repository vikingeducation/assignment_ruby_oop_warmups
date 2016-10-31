def my_reverse(str)
  # result = ''
  # # str = str.to_a
  # my_arr = str.split('')
  # while !my_arr.empty?
  #   result += my_arr.pop
  # end
  # result

  (str.length - 1).downto(0) { |i| puts str[i] }
end