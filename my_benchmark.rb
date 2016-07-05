def my_benchmark(no_of_times)
	time1 = Time.now
	no_of_times.times {yield}
	time2 = Time.now
	duration = time2 - time1
	return duration
end