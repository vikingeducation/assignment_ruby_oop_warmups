def fibonacci(number)
  fibonacci_sequence = []
  number.times do |counter|
  	if fibonacci_sequence.length == 1 || fibonacci_sequence.length == 0
  	  fibonacci_sequence << 1
  	else
  	  fibonacci_sequence << (fibonacci_sequence[counter-2] + fibonacci_sequence[counter-1])
  	end
  end
return fibonacci_sequence
end

fibonacci(7)
