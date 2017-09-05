# Build a method that reverses any string you put into it, and don't use the built-in reverse.
def my_reverse(string)
  original = string.chars
  reversed = []
  while original.length > 0
    reversed << original.pop
  end
  reversed.join
end

puts my_reverse("Blah!")