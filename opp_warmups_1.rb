
def my_reverse(str)
  str_reversed = ''
  (str.length-1).downto(0) { |index| str_reversed << str[index] }
  str_reversed
end
