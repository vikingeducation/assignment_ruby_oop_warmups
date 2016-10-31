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
        output_array.push(yield(i))
      else
        output_array.push(proc.call(i))
      end
    end
    output_array
  end

  def my_select(proc=nil)
    output_array = []
    self.my_each do |element|
      if block_given?
        if yield(element)
          output_array.push(element)
        end
      else
        if proc.call(element)
          output_array.push(element)
        end
      end
    end
    output_array
  end

  def my_all?(proc=nil)
    result = true
    self.my_each do |element|
      if block_given?
        if !yield(element)
          result = false
        end
      else
        if !proc.call(element)
          result = false
        end
      end
    end
    result
  end

  def my_inject(initial=nil, proc=nil)
    memo = initial
    self.my_each do |element|
      if block_given?
        if !yield(element)
          result = false
        end
      else
        if !proc.call(element)
          result = false
        end
      end
    end      
  end

end

[1,2,5].my_inject(0) do |memo, item|
   memo + item
end





