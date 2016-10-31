def my_reverse(str)
  result = ''
  # str = str.to_a
  my_arr = str.split('')
  while !my_arr.empty?
    result += my_arr.pop
  end
  result
end