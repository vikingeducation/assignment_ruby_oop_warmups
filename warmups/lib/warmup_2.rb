def my_benchmark(number_of_times, &block)
	start_time = Time.now
	number_of_times.times do
		block
	end
	ellasped_time = Time.now - start_time
	return ellasped_time
end