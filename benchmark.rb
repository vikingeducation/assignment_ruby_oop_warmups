def my_benchmark(num)
  arr = []

begin_time = Time.now
  num.times do
      yield
  end
end_time = Time.now
arr.push(end_time - begin_time)
  p arr.reduce(:+)
end

my_benchmark(1000) {puts "hi"}
