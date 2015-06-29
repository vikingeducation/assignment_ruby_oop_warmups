def my_reverse(string)
  reverse_string = ""
  string_array = string.split("")

  string_array.length.times do
    reverse_string += string_array.pop()
  end
  reverse_string
end
# my_reverse("garrett")


def fibs(num)
  fib_array = [0,1]
  if num == 1
    fib_array[0].to_a
  elsif num == 2
    fib_array
  else num > 2
    (num-2).times do
      fib_array.push(fib_array[-1] + fib_array[-2])
    end
  end
  fib_array
end
 #p fibs(8)

def my_benchmark(num_times)
  t1= Time.now
  num_times.times do
    yield
  end
  time = Time.now - t1
end

#puts my_benchmark(10000) { puts "hi" }
class Array

  def my_each (proc = nil)
    i = 0
    while i < self.length
      if block_given?
        yield (self[i])
      else
        proc.call (self[i])
      end
      i+=1
    end
    return self
  end

  def my_map (proc = nil)
    return_array = []
    self.my_each do |item|
      if block_given?
        return_array.push(yield (item))
      else
        return_array.push(proc.call(item))
      end
    end
    p return_array
  end

  def my_select (proc = nil)
    return_array =[]
    self.my_each do |item|
      if block_given?
        if yield(item)
          return_array.push(item)
        end
      else
        if proc.call(item)
          return_array.push(item)
        end
      end
    end
    p return_array
  end

  def my_all? (proc = nil)
    self.my_each do |item|
      if block_given?
        if !yield(item)
          return false
        end
      else
        if !proc.call(item)
          return false
        end
      end
    end
     true
  end

  def my_inject(sum = 0)
    memo = sum
    self.my_each do |item|
      memo = yield(memo, item)
    end
    puts memo
  end
end



#[1,2,5].my_inject() do |memo, item|
#  memo + item
#end

# my_proc = Proc.new{|item| item.even?}
# [1,2,4].my_all?(my_proc) #without &

# my_proc = Proc.new{|item| item.even?}
# [1,2,5].my_select(my_proc)

# my_proc = Proc.new {|item| item ** 2}
# [1,2,5].my_map (my_proc)
#[1,2,5].my_each {|item| puts item}
 #my_proc = Proc.new {|item| puts item**2}
 ##[1,2,5].my_each(my_proc)











