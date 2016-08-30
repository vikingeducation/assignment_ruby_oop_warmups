def my_benchmark(numtimes)
	start_time = Time.now
	numtimes.times{yield}
	Time.now - start_time
end