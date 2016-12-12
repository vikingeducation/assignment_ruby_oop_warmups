def fibs(num)
	prev_val = 0
	new_val = 1
	fib_seq = []
	if num < 1
		fib_seq
	elsif num < 2
		fib_seq << prev_val
	else
		fib_seq << prev_val
		fib_seq << new_val
		(num - 2).times do |variable|
			fib_seq << fib_seq[fib_seq.size - 1] + fib_seq[fib_seq.size - 2]
		end
		fib_seq
	end
end


p fibs(8)