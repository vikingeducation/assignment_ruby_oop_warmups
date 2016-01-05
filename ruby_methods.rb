def my_reverse(string)
  arr = string.split("")
  new_arr = []

  arr.each do |i|
    new_arr.unshift(i)
  end
  new_arr.join

end



def fib_rec(int)
  return int if (0..1).include? int
  (fib_rec(int-1) + fib_rec(int-2))
end



def fibs(int)
  arr = []
  (0..int).each do |number| 
    arr.push(fib_rec(number))
  end
  return arr

end


def my_benchmark(number_of_times)
  start_time = Time.now
  number_of_times.times do 
    yield
  end
  end_time = Time.now
  end_time - start_time
end

my_benchmark(1) { "hi" }
my_benchmark(10000) { "hi" }
my_benchmark(1000000) { "hi" }




class Array
  def my_each(proc=nil)
    i = 0
    while i < self.length
      block_given? ? yield(self[i]) : proc.call(self[i])
      i += 1    
    end
  end


  def my_map(proc=nil)
    result = []
    self.my_each do |item|
      block_given? ? (result << yield(item)) : (result << proc.call(item))
    end
    result
  end


  def my_select(proc=nil)
    result = []
    self.my_each do |item|
      if block_given?
        result << item if yield(item)
      else 
        result << item if proc.call(item)
      end
    end
    result
  end

  # not quite working yet
  def my_all?(proc=nil)
    self.my_each do |item|
      if block_given?
        return false if !yield(item)
      else
        return false if !proc.call(item)
      end
    end
    true
  end



  def my_inject(memo, proc=nil)
    sum = memo
    self.my_each do |item|
      block_given? ? sum += yield(memo, item) : sum += proc.call(memo, item)
      #sum += yield(memo, item)
    end
    return sum
  end

end

# Blocks and Procs both work for my_inject:
# example = Proc.new { |memo, item| memo + item }
# [1,2,5].my_inject(0, example) 

# [1,2,5].my_inject(0) do |memo, item|
#   memo + item
# end
#
# &block as a parameter will keep blocks the same but will convert procs into blocks.
# In my_inject, proc=nil must be the parameter otherwise there will be an error when passing
#       in a proc. Unless you add an '&' to the parameter you're passing through.