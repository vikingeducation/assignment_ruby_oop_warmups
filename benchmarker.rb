def my_benchmark(times)
	start = Time.now
	times.downto(0) do 
		yield
	end

	return Time.now - start

end

puts my_benchmark(1000) { puts "hi" }