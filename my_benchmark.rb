def my_benchmark num_of_times=1000
  start = Time.now
  num_of_times.times {yield}
  Time.now - start 
end

puts my_benchmark {puts "hi"}