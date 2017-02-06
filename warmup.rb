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

  def my_map(proc = nil)
    output = []

    if block_given?
      self.my_each { |item| output << yield(item) }
    elsif !proc.nil?
      self.my_each { |item| output << proc.call(item) }
    end

    # TODO: return an Enumerator object if
    # no block or proc argument is provided
    output
  end

  def my_select(proc = nil)
    output = []

    if block_given?
      self.my_each { |item| output << item if yield(item) }
    elsif !proc.nil?
      self.my_each { |item| output << item if proc.call(item) }
    end

    # TODO: return an Enumerator object if
    # no block or proc argument is provided
    output
  end

  def my_all?(proc = nil)
    all_true = true

    if block_given?
      self.my_each do |item|
        all_true = all_true && yield(item)
        return false unless all_true
      end
    elsif !proc.nil?
      self.my_each do |item|
        all_true = all_true && proc.call(item)
        return false unless all_true
      end
    else
      # neither block nor proc provided -
      # check if all members of the collection
      # are truthy
      self.my_each do |item|
        all_true = all_true && item
        return false unless all_true
      end
    end

    true if all_true
  end

  def my_inject(initial, proc = nil)
    memo = initial

    if block_given?
      self.my_each do |item|
        memo = yield(memo, item)
      end
    elsif !proc.nil?
      self.my_each do |item|
        memo = proc.call(memo, item)
      end
    end

    memo
  end
end
