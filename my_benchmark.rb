def my_benchmark(number_of_times)
	#gets first time mark
	previous_time  = Time.now
	#prints n amount of times
	number_of_times.times  { puts "Hi" }
    #gets time after block is ran
	current_time = Time.now
	#gets the difference between the times
	benchmark =  current_time - previous_time
	
	puts benchmark
	
end



