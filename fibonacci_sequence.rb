def fibs(int)
	fib_array = [0, 1]
	counter = 2
	while counter < int 
		fib_array << fib_array[-1] + fib_array[-2]
		counter += 1
	end
	return fib_array
end