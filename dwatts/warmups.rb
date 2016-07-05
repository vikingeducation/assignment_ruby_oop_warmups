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

  def my_map(proc)
      array = []
      self.length.times do |i|
        array[i] = proc.call(self[i])
      end
      array
  end

  def my_select(proc)
    array = []
    self.length.times do |i|
      array.push(self[i]) if proc.call(self[i])
    end
    array
  end

  def my_all?(proc)
    if my_select(proc).length == self.length
      return true
    else
      return false
    end
  end

  def my_inject(n=0, proc)
    memo = n
    self.length.times do |i|
      item = self[i]

      memo = proc.call(memo,item)
    end
    memo
  end

end
