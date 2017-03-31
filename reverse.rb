def my_reverse(str)
  #takes a string
  str = str.split("")
  #reverses string
  backwards_array = []
  str.each do |i|
    backwards_array.unshift(i)
  end
  #returns reversed string
  print backwards_array.join
end

my_reverse("Hello there cutie pie!")
