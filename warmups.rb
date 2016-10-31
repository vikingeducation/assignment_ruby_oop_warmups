def my_reverse(input)
  input_array = input.split('')
  output_array = []
  while input_array.length > 0
    x = input_array.pop
    output_array.push(x)
  end
  output_array.join('')
end

def fibs(number)
  return [] if number == 0
  return [0] if number == 1
  fib_array = [0, 1]
  while fib_array.length < number
    new_number = fib_array[-2] + fib_array[-1]
    fib_array.push(new_number)
  end
  fib_array
end

def my_benchmark(number_of_times)
  start_time = Time.now
  number_of_times.times do
    yield
  end
  end_time = Time.now
  end_time - start_time
end

class Array

  def my_each(proc=nil)
    for index in 0...self.length
      if block_given?
        yield(self[index])
      else
        proc.call(self[index])
      end
    end
  end

  def my_map(proc=nil)
    output_array = []
    self.my_each do |i|
    # for index in 0...self.length
      if block_given?
        output_array.push(yield(self[index]))
      else
        output_array.push(proc.call(self[index]))
      end
    end
    output_array
  end

end

# [1,2,5].my_each{ |item| puts item }
my_proc = Proc.new{|item| puts item**3}
# [1,2,5].my_each(my_proc)

# x = [1,2,5].my_map do |item|
#  item ** 2
# end
# puts x
x = [1,2,5].my_map(my_proc)
