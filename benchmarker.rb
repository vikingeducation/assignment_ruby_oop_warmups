def my_benchmark(number_of_times)
  start_time = Time.now
  number_of_times.times do
    yield
  end
  end_time = Time.now
  end_time-start_time
end

my_benchmark(5){puts 'hi'}

#Is there a better way than putting out all the 'hi'