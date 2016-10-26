# Warmup 2: Benchmarker

# benchmarker

def my_benchmark(number_of_times)
  time_start = Time.now
  (1..number_of_times).each do |number|
    puts "hi"
  end
  time_end = Time.now
  print "\n"
  puts "time_start #{time_start}"
  puts "time_end = #{time_end}"
  puts "time taken = #{(time_end - time_start)}"
  print "\n"  
end

my_benchmark(1000000)
