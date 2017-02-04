def my_reverse(string)
  reverse_string = ""

  i = -1
  string.length.times do
    reverse_string += string[i]
    i -= 1
  end

  reverse_string
end