def my_reverse(string)
	string = string.split ''
	new_string = ""
	string.length.times do
		new_string += string.pop
	end
	puts new_string
end
my_reverse("Bang!")