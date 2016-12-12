def my_reverse(string_to_reverse)
	reversed = []
	original = string_to_reverse.split("")
	original.each_with_index do |char, index|
		reversed[original.size - 1 - index] = char
	end
	reversed.join
end


puts my_reverse("Blah!")