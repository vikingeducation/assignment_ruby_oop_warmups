def my_reverse str
  str.split("").reduce("") do |acc, char|
    char + acc
  end
end

def fib n
  "takes an integer and returns an array of that many elements, which
  starts with 0 and 1"
  x, y, acc = 0, 1, [0]
  (n-1).times do
    acc.push y
    x, y = y, x+y
  end
  acc
end

def fib2(n)
  x, y = 0, 1
  (1...n).reduce([0]) do |acc, i|
    acc.push(y)
    x, y = y, (x + y)
    acc
  end
end

def my_benchmark number_of_times
  start = Time.now
  number_of_times.times do
    yield
  end
  Time.now - start
end


class Array
  def my_each
    self.length.times do |i|
      yield(self[i])
    end
    self
  end

  def my_map
    acc = []
    self.my_each do |item|
      acc.push(yield(item))
    end
    acc
  end

  def my_select
    acc = []
    self.my_each do |item|
      if yield(item)
        acc.push(item)
      end
    end
    acc
  end

  def my_all?
    result = true
    self.my_each do |item|
      if yield(item) == false
        result = false
        break
      end
    end
    result
  end

  def my_inject initial
    acc = initial
    self.my_each do |item|
      acc = yield(acc, item)
    end
    acc
  end
end
