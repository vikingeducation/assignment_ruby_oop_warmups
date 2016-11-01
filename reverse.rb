#Build a method that reverses any string you put into it, and don't #use the built-in reverse.

def my_reverse(str)
  original_array = str.chars
  new_array = []
  until original_array.empty? do 
    new_array << original_array.pop
  end
  new_array.join 
end

puts my_reverse("test string")
