
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

# this method outputs an array of the fibonacci sequence starting at 0 and up to the integer given
def fibonacci(integer)
  sequence = []
  if integer == 0
    puts "Please enter a number above 0"
  elsif integer == 1
    puts "The first number in the Fibonacci Sequence is [0]"
  else
    first = 0
    second = 1
    integer.times {
      sequence << first
      increment = first + second
      first = second
      second = increment
    }
    puts "The first #{integer.to_s} numbers in the Fibonacci Sequence are #{sequence}"
  end
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
    diff = endy - start
    puts "The amount of time it took to run the block #{number_of_times} times is #{diff} seconds"
end

my_benchmark(10000) { puts "hi" }
my_benchmark(100000) { 9 * 9 }
my_benchmark(10000) { 6857 % 8 }

# this method is a replacement for ruby's native each
public
def my_each(proc = nil)
  if proc == nil
    length.times do |index|
      yield(self[index])
    end
  else
    length.times do |index|
      proc.call(self[index])
    end
  end
end

[1,2,5].my_each{ |item| puts item }

exponent = Proc.new{|item| puts item**2}
[1,2,5].my_each(exponent)

# this method is a replacement for ruby's native map
def my_map(proc = nil)
  mapped = []
  if proc == nil
    my_each do |value|
      mapped << yield(value)
    end
  else
    my_each do |value|
      mapped << proc.call(value)
    end
  end
  puts "#{mapped}"
end

[1,2,5].my_map do |item|
  item ** 2
end

half = Proc.new{|item| item/2}
[10,20,50].my_map(half)

# this method is a replacement for ruby's native select
def my_select(proc = nil)
  selected = []
  if proc == nil
    my_each do |value|
      selected << value if yield(value)
    end
  else
    my_each do |value|
      selected << value if proc.call(value)
    end
  end
  puts "#{selected}"
end

[2,3,6].my_select{|item| item.frozen?}

even = Proc.new{|item| item.even?}
[1,2,5].my_select(even)

# this method is a replacement for ruby's native all?
def my_all?(proc = nil)
  result = false
  if proc == nil
    my_each do |value|
      result = yield(value)
      break if result == false
    end
  else
    my_each do |value|
      result = proc.call(value)
      break if result == false
    end
  end
  puts result
end

[2,3,6].my_all?{|item| item.frozen?}

not_odd = Proc.new{|item| item.even?}
[8,9,10].my_all?(not_odd)

# this method is a replacement for ruby's native inject
def my_inject(sum, proc = nil)
  if proc == nil
    my_each do |value|
      sum = yield(sum, value)
    end
  else
    my_each do |value|
      sum = proc.call(sum, value)
    end
  end
  puts sum
end

[1,2,5].my_inject(0) do |memo, item|
  memo + item
end

total = Proc.new{|memo, item| memo + item}
[1,2,3].my_inject(0, total)
