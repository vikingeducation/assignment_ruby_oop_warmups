def my_reverse(str)
  reversed_string = ''
  str.size.downto(1) do |c|
    reversed_string += str[c - 1]
  end
  reversed_string
end
