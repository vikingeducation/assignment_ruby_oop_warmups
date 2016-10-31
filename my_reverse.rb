def my_reverse(string)
	split_string = string.split("")
	reversed_array = []

	split_string.each do |letter|
		reversed_array.unshift(letter)
	end

	return reversed_array.join("")
end

puts my_reverse('vikingcode')