# Build a method that reverses any string you put into it, and don't use the built-in reverse.

def my_reverse(string)
  result = []
  -1.downto(string.length * -1).each do |i|
    result.push(string[i])
  end
  return result.join
end



puts my_reverse("Blah!")
#=> !halB