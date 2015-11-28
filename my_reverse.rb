=begin
  To Do:
  - Build a method that reverses any
  - String
  - You put into it
  - Don't you the built-in reverse

  ideas
  - (it has to return that string at the end so you want to return a reversed string)
  - go through each letter of that string, and unshift it onto another string.
=end

def my_reverse(string)
  new_word = []
  string.split('').each do |letter|
    new_word.unshift(letter)
  end
  new_word.join('')
end

puts my_reverse("No Mistake")

