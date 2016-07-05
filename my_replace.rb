def my_reverse(string)
  return_string = ''
  string.chars.reverse_each do |char|
    return_string << char
  end
  return_string
end
