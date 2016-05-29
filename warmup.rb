def my_reverse(st)
  st.reverse
end

puts my_reverse("Blah!")
# *********************************
def fibs(int)
  var1 = 0
  var2 = 1
  result = []
  int.times do
    result << var1
    sum = var1 + var2
    var1 = var2
    var2 = sum
  end
  print result
end

fibs(3)
puts ""
fibs(8)
puts ""
# **********************************
def my_benchmark(times)
  start_time = Time.now
  times.times do
    yield
  end
  end_time = Time.now
  puts end_time - start_time
end

my_benchmark(10000) { "hi" }
# ***********************************
class Array
  def my_each
    counter = 0
    while counter < self.length
      yield self[counter]
      counter += 1
    end
  end
end

[1,2,5].my_each{ |item| puts item }

my_proc = Proc.new{|item| puts item**2}
[1,2,5].my_each(&my_proc)
# ***********************************
class Array
  def my_map
    result = []
    counter = 0
    while counter < self.length
      r = yield self[counter]
      result << r
      counter += 1
    end
    print result
  end
end

[1,2,5].my_map {|item| item**2}
puts ""
# ************************************
class Array
  def my_select
    result = []
    counter = 0
    while counter < self.length
      if yield self[counter]
        result << self[counter]
      end
      counter += 1
    end
    print result
  end
end

my_proc = Proc.new{|item| item.even?}
[1,2,5].my_select(&my_proc)
puts ""
# *************************************
class Array
  def my_all?
    counter = 0
    while counter < self.length
      if not yield self[counter]
        return false
      end
      counter += 1
    end
    return true
  end
end

my_proc = Proc.new{|item| item.even?}
puts [1,2,5].my_all?(&my_proc)
# *************************************
class Array
  def my_inject(start)
    counter = 0
    item = start
    while counter < self.length
      item = yield self[counter], item
      counter += 1
    end
    puts item
  end
end

[1,2,5].my_inject(0) do |memo, item|
  memo + item
end
# *************************************





