def fibonacci_sequence(n)
	results = []
	n.times do |i|
		
		if i < 2
			results << i
		else
			results << results[-1] + results[-2]
		end
	end 
	print results

end

fibonacci_sequence(8)