#################warmup1################
def reverse(str)
  array = str.split("")
  reverse_str = []
  while true
    break if array == []
    reverse_str
    reverse_str << array.pop
  end
 return reverse_str.join("")
end

#p reverse("hi what is your name")

def fibonacci(terms)
  array = []
  array << 0
  current_term = 1
  return if terms == current_term
  array << 1
  current_term = 2
  return array if terms == current_term
  while true
    break if array.count == terms
    a = array[-1]
    b = array[-2]
    c = a + b
    array << c
  end
  print array
end

#################warmup2################

def my_benchmark(number_of_times)
  start = Time.now
  time = 0
  while time < number_of_times
    yield
    time += 1
  end
  stop = Time.now
  return start - stop
end

#print my_benchmark(10){puts "hi"}

#################warmup3################
class Array
  def my_each
    i = 0
    while i < self.count
      yield(self[i])
      i += 1
    end
  end

  def my_map
    i = 0
    while i < self.count
      self[i] = yield(self[i])
      i += 1
    end
  end

  def my_select
    i = 0
    @new_arr = []
    while i < self.count
      @new_arr << self[i] if yield(self[i])
      i += 1
    end
    return @new_arr
  end

  def my_all?
    i = 0
    while i < self.count
      return false unless yield(self[i])
      i += 1
    end
    return true
  end

  def my_inject(sym)
    if sym == :+
      sum = 0
      self.my_each do {|num| sum += num}
      return sum
    elsif sym == :*
      prod = 1
      self.my_each do {|num| prod *= num}
      return prod
  end
end
