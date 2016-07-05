def my_reverse(string)
  new_string = ""
  string.each_char {|letter| new_string.insert(0, letter) }
  new_string


end

puts my_reverse("Blah!")