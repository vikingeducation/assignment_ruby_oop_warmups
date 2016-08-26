def my_benchmark(num_times)
	
	start_time = Time.now
	
	num_times.times do 
		yield
	end

	end_time = Time.now

	total_time = end_time - start_time

	puts "It took #{total_time} seconds to process your block."

end

my_benchmark(10) {puts "hi"}