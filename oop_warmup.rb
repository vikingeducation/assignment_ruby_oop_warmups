
# this method is simply a replacement for ruby's built in reverse method
def reverse(string)
  if string != string.to_s
   puts "Please enter only a word or words to reverse, #{string} is not valid."
  else
    index = string.length - 1
    flipped = ""
    while index > -1
      flipped += string[index]
      index -= 1
    end
    puts "The reverse of #{string} is #{flipped}."
  end
  flipped
end

reverse("fish")
reverse(5.0)
reverse("french horn")

# this method outputs an array of the fibonacci sequence up to the specified number of members
def fibonacci(integer)
  sequence = [0]
  if integer == 0
    puts "Please enter a number above 0"
  else
    pattern = 1
    (integer - 1).times do |index|
      sequence << pattern
      pattern = pattern + sequence[index]
    end
    puts "The first #{integer.to_s} numbers in the Fibonacci Sequence are #{sequence}"
  end
  sequence
end

fibonacci(1)
fibonacci(8)
fibonacci(0)
fibonacci(2)

# this method will run the block its given the amount of times requested then determine how long it took
def my_benchmark(number_of_times)
  start = Time.now
  number_of_times.times {
    yield
  }
  endy = Time.now
  length = endy - start
  puts "The amount of time it took to run the block #{number_of_times} times is #{length} seconds"
  length
end

my_benchmark(10000) { puts "hi" }
my_benchmark(100000) { 9 * 9 }
my_benchmark(10000) { 6857 % 8 }

# this method is a replacement for ruby's native each
public
def my_each(proc = nil)
  length.times do |index|
    if proc == nil
      yield(self[index])
    else
      proc.call(self[index])
    end
  end
  self
end

[1,2,5].my_each{|item| puts item**2}
[1,2,5].my_each(Proc.new{|item| puts item**2})

# this method is a replacement for ruby's native map
def my_map(proc = nil)
  mapped = []
  my_each do |value|
    if proc == nil
      mapped << yield(value)
    else
      mapped << proc.call(value)
    end
  end
  puts "#{mapped}"
  mapped
end

[1,2,5].my_map{|item| item ** 2}
[10,20,50].my_map(Proc.new{|item| item/2})

# this method is a replacement for ruby's native select
def my_select(proc = nil)
  selected = []
  my_each do |value|
    if proc == nil
      selected << value if yield(value)
    else
      selected << value if proc.call(value)
    end
  end
  puts "#{selected}"
  selected
end

[4,6,8].my_select{|item| item.even?}
[1,2,5].my_select(Proc.new{|item| item.even?})

# this method is a replacement for ruby's native all?
def my_all?(proc = nil)
  my_each do |value|
    if proc == nil
      return false if !yield(value)
    else
      return false if !proc.call(value)
    end
  end
  return true
end

test1 = [2,4,6].my_all?{|item| item.even?}
puts test1
test2 = [8,9,10].my_all?(Proc.new{|item| item.even?})
puts test2

# this method is a replacement for ruby's native inject
def my_inject(sum, proc = nil)
  my_each do |value|
    if proc == nil
      sum = yield(sum, value)
    else
      sum = proc.call(sum, value)
    end
  end
  puts sum
  sum
end

[6,7,8].my_inject(0){|memo, item| memo + item}
[1,2,3].my_inject(0, Proc.new{|sum, value| sum += value})
