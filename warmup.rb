# Warmup 1: Ruby Methods

def my_reverse(string)
  len = string.length
  chars = string.chars
  output = []

  len.downto(0) { |index| output << chars[index] }

  output.join
end

def fibonacci(number)
  if number == 1
    0
  elsif number == 2
    1
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

def fibs(numbers)
  result = []
  1.upto(numbers) { |number| result << fibonacci(number) }

  result
end


# Warmup 2: Benchmarker

def my_benchmark(number_of_times)
  return 0 if number_of_times <= 0
    
  if block_given?
    before = Time.now
    number_of_times.times { |iteration| yield }
    after = Time.now

    after - before
  else
    0
  end
end


# Warmup 3: Rebuild the Enumerable Methods

class Array
  def my_each(proc = nil)
    if block_given?
      i = 0
      while i < self.size
        yield(self[i])
        i += 1
      end
    elsif !proc.nil?
      self.size.times { |i| proc.call(self[i]) }
    end

    self
  end
end
