# Challenge : 
# Write a method, my_benchmark, that takes a parameter number_of_times and a block and returns how long that block took to run that block, that many times. 
# Remember, you can get the current time using Time.now, and you can subtract one time from another to get a duration in seconds.

# Solution : 
def my_benchmark(num)
  time_later = 0
  current_times = Time.now
  num.times do
    puts "hi"
    time_later = Time.now
  end
  current_times - time_later
end

my_benchmark(10000)
