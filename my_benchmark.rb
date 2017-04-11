def my_benchmark(hm_times)
  block_execution_starts = Time.now
  hm_times.times do
    yield
  end
  puts(Time.now - block_execution_starts)
end

my_benchmark(10000) {puts("Hi")}
