def my_reverse(string)
  array = string.split("")
  new_array = []
  array.each do |x|
    new_array.unshift(x)
  end

  new_string = new_array.join("")
  return new_string
end

def fibs(n)
  fib_array = [0, 1, 1]
  until fib_array.length == n
    fib_array << fib_array[-1] + fib_array[-2]
  end

  return fib_array
end

#puts fibs(10)

def my_benchmark(n, &block)
  time1 = Time.now
  n.times do
    block.call
  end

  Time.now-time1
end


class Array
  def my_each(my_proc)
    self.length.times do |i|
      my_proc.call(self[i])
    end
  end

  def my_map(my_proc)
    array = []
  end

end

my_proc = Proc.new{|item| puts item ** 2}

[1,2,5].my_each(my_proc)