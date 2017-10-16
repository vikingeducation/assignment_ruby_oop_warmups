# Build a method that reverses any string you put into it, and don't use the built-in reverse

def my_reverse(input)
  reverse_str = ""
  (input.length - 1).downto(0) { |idx| reverse_str += input[idx] }
  reverse_str
end

puts my_reverse('Hello')
puts my_reverse('All the world people are happy')