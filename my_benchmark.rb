def my_benchmark(number_of_times)
  start_time = Time.now
  while number_of_times > 0
    yield
    number_of_times -= 1
  end
  puts Time.now.to_f - start_time.to_f
end


my_benchmark(10000) { puts "hi" }

#ISSUES=====================
#Returns all his and puts seconds rather than return only seconds
