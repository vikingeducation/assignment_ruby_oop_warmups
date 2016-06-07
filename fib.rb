## FIBONACCI SEQUENCE ##

def fibs( num )

	# initial array for fibonacci
	fib_start = [0,1]

	index = 0

		if num == 1
			print [0]
			return [0]
		end

	# until the count of result is the given num
	until fib_start.count >= num

		# if the array is 1 or 2 we return [0] or [0,1]


	fib_start << fib_start[ index ] + fib_start[ index + 1 ]

	# we add index 0 and index 1 and push into the array
	# we then increment to the next index and continue to push
  index += 1

  end

print fib_start

end


puts "\rEnter a number\r"
num = gets.strip
fibs(num.to_i)
