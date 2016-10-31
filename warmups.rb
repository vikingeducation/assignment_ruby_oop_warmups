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
    if block_given?
      for index in 0...self.length
        yield(self[index])
      end
    else
      for index in 0...self.length
        proc.call
      end
    end
  end
end

#[1,2,5].my_each{ |item| puts item }
my_proc = Proc.new{|item| puts item**2}
[1,2,5].my_each(my_proc)
