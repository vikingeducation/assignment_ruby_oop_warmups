
def my_reverse(str)
  str_reversed = ''
  (str.length-1).downto(0) { |index| str_reversed << str[index] }
  str_reversed
end

def fibs(order)
  fibo = [0]
  while fibo.length < order
    fibo << fibo[-1]  + ( fibo[-2] == nil ? 1 : fibo[-2])
  end
  fibo
end

def my_benchmark(iter)
  start = Time.now
  iter.times {yield}
  Time.now - start
end

class Array
  def my_each(proc = nil)
    size.times { |index| block_given? ? yield(self[index]) : proc.call(self[index]) }
  end

  def my_map(proc = nil)
    size.times { |index| block_given? ? self[index] = yield(self[index]) : self[index] = proc.call(self[index]) }
  end
end
