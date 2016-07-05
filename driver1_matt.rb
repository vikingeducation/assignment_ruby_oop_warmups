def my_reverse(string)
	array_string = string.split('')
	reverse_array = []
	array_string.each do |char|
		reverse_array.unshift(char)
	end
	reverse_array.join('')
end