def my_reverse(string)
  reverse_string = ""
  string_array = string.split("")

  string_array.length.times do
    reverse_string += string_array.pop()
  end
  reverse_string
end
# my_reverse("garrett")



