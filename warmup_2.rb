
def my_benchmark(number_of_times, &block)

  start = Time.now

  number_of_times.times do

    block.call

  end

  finish = Time.now

  return (finish - start)

end

#p my_benchmark(1000000) { 1 + 1 }