def my_reverse(str)
  reversed = ''
  -1.downto(-str.length) do |i|
    reversed << str[i]
  end
  reversed
end
