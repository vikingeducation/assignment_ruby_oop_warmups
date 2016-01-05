
def my_benchmark(num)
   init = Time.now
   num.times do
      yield
   end
   return "#{Time.now - init} seconds"
end

puts my_benchmark(1000000) { puts "hi" }