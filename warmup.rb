def my_reverse(str)
  answer = ""
  str.length.downto(1) do |i|
    answer << str[i - 1]
  end
  answer
end

def fib(size)
  arr = []
  size.times {|i| arr << fib_recursive(i)}
  return arr
end

def fib_recursive(size)
  return size if size == 0 || size == 1
  return fib_recursive(size - 1) + fib_recursive(size - 2)
end

def benchmark(num_times = 1)
  total = 0
  num_times.times do
    time = Time.now
    yield
    time = Time.now - time
    total += time
  end
  total
end

class Array
  def my_each (proc_argument = nil)
    0.upto(self.length - 1) do |item|
      if block_given?
        yield self[item]
      else
        proc_argument.call(self[item])
      end
    end
  end

  def my_inject(initial_value, proc_argument = nil)
    total = initial_value
    self.my_each do |item|
      if block_given?
        total = yield(total,item)
      else
        total = proc_argument.call(total,item)
      end
    end
    return total
  end
end
