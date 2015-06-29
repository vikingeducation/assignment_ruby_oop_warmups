def my_reverse (str)

  arr = str.split('')

  result = []
  until arr.empty?
    result << arr.pop()
  end

  return result.join('')

end


# puts my_reverse("string")


def fib_helper(num)

  if num == 0
    return 0
  elsif num == 1
    return 1
  else
    return fib_helper(num - 1) + fib_helper(num - 2)
  end

end

def fibs (num)

  arr = []
  num.times do |value|
    arr.push(fib_helper(value))
  end

  return arr

end


# p fibs(8)

def my_benchmark(num)

  start_time = Time.now
  num.times do
    yield
  end

  Time.now - start_time

end



# puts my_benchmark(10000) {puts "hi"}

class Array

  def my_each(proc_argument = nil)
    i = 0
    while !self[i].nil?
      if block_given?
        yield self[i]
      else
        proc_argument.call(self[i])
      end
      i += 1
    end
    return self
  end

  def my_map(proc_argument = nil)
    result = []
    self.my_each do |val|
      if block_given?
        result << yield(val)
      else
        result << proc_argument.call(val)
      end
    end
    puts result
    return result
  end

  def my_select(proc_argument = nil)
    result = []
    self.my_each do |val|
      if block_given?
        if yield(val)
          result << val
        end
      else
         if proc_argument.call(val)
          result << val
        end
      end
    end
    return result
  end

  def my_all?(proc_argument = nil)
    self.my_each do |val|
      if block_given?
        if !yield(val)
          return false
        end
      else
        if !proc_argument.call(val)
          return false
        end
      end
    end
    return true
  end

  # Memo = running total
  # item = current val

  def my_inject(arg = 0, proc_argument = nil)
    memo = arg
    self.my_each do |item|
      if block_given?
        memo = yield(memo, item)
      else
        memo = proc_argument.call(memo, item)
      end
    end
    

    return memo

  end

end

#[1,2,5].my_each {|item| puts item}

# my_proc = Proc.new{|item| puts item ** 2}

#[1,2,5].my_each(my_proc)

# p [1,2,5].my_map {|item| item ** 2}

# my_second_proc = Proc.new{|item| item ** 2}

# p [1,2,5].my_map(my_second_proc)

# my_third_proc = Proc.new{|num| num.even?}
# p [1,2,5].my_select{|item| item.even?}

# p [1,2,5].my_select(my_third_proc)

# p [4,2,6].my_all?{|item| item.even?}

# p [2,4,6].my_all?(my_third_proc)

my_fourth_proc = Proc.new{|memo, item| memo * item}

p [1,2,5].my_inject(0) {|memo, item| memo + item}

p [1,2,7].my_inject(1, my_fourth_proc)

