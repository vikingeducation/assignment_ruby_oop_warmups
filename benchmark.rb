def my_benchmark(this_many)
   start_time = Time.now
   this_many.times do
     yield
   end
   puts(Time.now - start_time)
 end

 my_benchmark(10000) {puts("Hi")}
