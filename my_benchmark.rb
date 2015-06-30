def my_benchmark(n)

	start = Time.now

	n.times do 

		yield

	end

	Time.now - start

end

puts my_benchmark(1000) { puts "Hi" }