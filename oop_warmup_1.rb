
# WARMUP 1: Ruby Functions 
## Function 1: reverse string 

def my_reverse(string)
  if string.length % 2 == 0
    n = string.length/2
  else
    n = string.length/2 + 1
  end

  n.times do |i|
    temp = string[i]
    string[i] = string[-i-1]
    string[-i-1] = temp
  end

  puts string
end

## Function 2: Fibonacci

### Version 1

def fibonacci(n)
  fibo_nums = [0, 1]

  (n-2).times do 
    fibo_nums << fibo_nums[-2] + fibo_nums[-1]
  end

  fibo_nums
end

### Version 2 (recursive)

def fibonacci(n)
  fibo_nums []

  n.times do |i|
    fibo_nums << recursive_fibo(i)
  end

  fibo_nums
end

def recursive_fibo(n)
  if n == 0 || n == 1
    n
  else
    recursive_fibo(n-1) + recursive_fibo(n-2)
  end
end

# WARMUP 2: Benchmarker

def my_benchmark(n)
  start = Time.now
  n.times do
    yield
  end
  total_time = Time.now	- start

  total_time
end

# WARMUP 3: Rebuild the Enumerable Methods

class Array 

  ## Function 1: my_each, own implementation of Enumerable#each
  def my_each 
    (self.length).times do |i|
      yield self[i]
    end
    self
  end

  ## Function 2: my_map, own implementation of Enumerable#map
  def my_map
    result = []

    self.my_each do |el|
      result << yield(el)
    end

    result
  end

  ## Function 3: my_each, own implementation of Enumerable#select
  def my_select
    result = []

    self.my_each do |el|
      result << el if yield(el)
    end

    print result
  end

  ## Function 4: my_all?, own implementation of Enumerable#all?
  def my_all?

    self.my_each do |el|
      if !yield(el)
        false
        exit
      end
    end
    
    true

  end

  ## Function 5: my_inject, own implementation of Enumerable#inject
  def my_inject(first_value = nil)

    result = first_value

    self.my_each do |el|
      result = result.nil? ? el : yield(result, el)
    end

    print result
  end
end




