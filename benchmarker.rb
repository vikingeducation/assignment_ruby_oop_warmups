def my_benchmark(number_of_times=1)
  start = Time.now
  number_of_times.times do
    yield
  end
  finish = Time.now
  elapsed_time = finish - start
  puts elapsed_time
end

my_benchmark(10){puts "hi"}