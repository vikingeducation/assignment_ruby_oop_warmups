def my_benchmark(number_of_times, start = Time.now)
  number_of_times.times do
    yield
  end
  done = Time.now
  return (done - start).to_f
end
