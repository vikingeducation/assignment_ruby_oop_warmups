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

  def my_each
    i = 0
    while !self[i].nil?
      yield self[i]
      i += 1
    end
    return self
  end

  def my_map
    result = []
    self.my_each do |val|
      result << yield(val)
    end
    return result
  end

  def my_select
    result = []
    self.my_each do |val|
      if yield(val)
        result << val
      end
    end
    return result
  end

  def my_all?
    self.my_each do |val|
      if !yield(val)
        return false
      end
    end
    return true
  end

  # Memo = running total
  # item = current val

  def my_inject(arg = 0)
    memo = arg
    self.my_each do |item|
      memo = yield(memo, item)
    end

    return memo

  end

end

#[1,2,5].my_each {|item| puts item}

#my_proc = Proc.new{|item| puts item ** 2}

#[1,2,5].my_each(&my_proc)

#p [1,2,5].my_map {|item| item ** 2}

#p [1,2,5].my_select{|item| item.even?}

#p [4,2,6].my_all?{|item| item.even?}

p [1,2,5].my_inject(0) {|memo, item| memo + item}