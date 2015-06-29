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

  def my_each
    i = 0
    while i < self.length
      yield (self[i])
      i+=1
    end
    return self
  end

  def my_map
    return_array = []
    self.my_each do |item|
      return_array.push(yield (item))
    end
    return_array
  end

  def my_select
    return_array =[]
    self.my_each do |item|
      if yield(item)
        return_array.push(item)
      end
    end
    p return_array
  end

  def my_all?
    self.my_each do |item|
      if !yield(item)
        false
        break
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

 #my_proc = Proc.new{|item| item.even?}
 #[10,2,4].my_all?(&my_proc)

# my_proc = Proc.new{|item| item.even?}
# [1,2,5].my_select(&my_proc)

# [1,2,5].my_map do |item|
#   item ** 2
# end

#[1,2,5].my_each {|item| puts item}
# my_proc = Proc.new {|item| puts item**2}
# [1,2,5].my_each(&my_proc)











