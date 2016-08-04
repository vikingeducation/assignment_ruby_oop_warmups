def my_benchmark number_of_times
  time1 = Time.now
  number_of_times.times do yield
  end
  time2 = Time.now
  time = time2-time1
  return time
end
