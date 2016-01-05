
def my_benchmark(number)
  initial_time = Time.now
  number.times { yield }
  final_time = Time.now
  return (final_time - initial_time).to_s[0..7]
end

puts my_benchmark(10000) { puts "hi" }
