def my_reverse(string)
  string_array = string.split('')
  reversed_string = []
  reversed_string << string_array.pop until string_array.empty?
  reversed_string.join
end

puts my_reverse("Blah!")