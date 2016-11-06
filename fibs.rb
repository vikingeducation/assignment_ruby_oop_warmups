def fibs(num)
	return_array = [0, 1]
	if num == 0
		return []
	elsif num == 1
		return [0]
	elsif num == 2
		return return_array
	else
		(num - 2).times do
			return_array << (return_array[-1] + return_array[-2])
		end
	end
	return return_array
end
p fibs(0)
p fibs(2)
p fibs(3)
p fibs(4)