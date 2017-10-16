# Build a method that reverses any string you put into it, and don't use the built-in reverse

def my_reverse(input)
  str_to_arr = input.split("")
  reverse_arr = []
  str_len = str_to_arr.length
  str_len.times do
    item = str_to_arr.pop
    reverse_arr.push(item)
  end

  reverse_arr.join("")

end

puts my_reverse('Hello')