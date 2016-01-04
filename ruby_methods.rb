def my_reverse(string)
  arr = string.split("")
  new_arr = []

  arr.each do |i|
    new_arr.unshift(i)
  end
  new_arr.join

end


my_reverse("blah")
