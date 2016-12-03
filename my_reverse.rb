# Build a method that reverses any string you put into it, and don't use the built-in reverse.

def my_reverse(string)
  reverse_string = ""
  (string.length - 1).downto(0) { |i| reverse_string << string[i] }
  puts reverse_string
end

my_reverse("blah")