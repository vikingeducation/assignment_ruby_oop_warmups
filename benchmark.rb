def my_benchmark(num_of_times, &block) 
  start_time = Time.now
  num_of_times.times do 
  	yield
  end
  end_time = Time.now
  end_time-start_time
end

puts my_benchmark(10) { print "a" }
puts my_benchmark(500) { print "a" }