def fibs(int)

	return_array = []

	if int == 1

		return_array << 0

	elsif int > 1

		return_array << 0
		return_array << 1

		(2..int - 1).each do |i|

			return_array << return_array[i - 1] + return_array[i - 2]

		end

	end

	return_array

end

print fibs(2)