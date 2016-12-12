def my_benchmark(num)
	time_before = Time.now
	num.times do |variable|
		yield
	end
	time_after = Time.now
	time_after - time_before
end


p my_benchmark(10000) { puts "hi" }