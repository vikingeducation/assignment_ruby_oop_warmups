def my_reverse(word)  
  new_array = []

  word.split(//).each do |x|
    new_array.unshift(x)
  end

  new_array.join
end

name = "Blah!"
name = my_reverse(name)
puts name