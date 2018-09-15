def my_benchmark(number_of_times, &block)
  start = Time.now
  number_of_times.times do |function|
  end
  ending = Time.now
  puts (ending - start)
end
my_benchmark(10000){puts "hi"}
