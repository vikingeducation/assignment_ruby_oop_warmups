def my_reverse(string)
  result = ""
  string = string.split("")
  while string.size > 0
    result << string.pop
  end
  result
end