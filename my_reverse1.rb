def my_reverse(str)

    arr = str.split("")
    newArr = []
	arr.each do |item|
	   newArr.unshift(item)
	end   
	newArr.join("")
end


puts my_reverse("BLAH")
puts my_reverse("ELEPHANT")
puts my_reverse("QUICK")