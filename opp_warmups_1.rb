#warmup_1
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

#warmup_2
def my_benchmark(iter)
  start = Time.now
  iter.times {yield}
  Time.now - start
end

# warmup_3
class Array
  def my_each(proc = nil)
    size.times { |index| block_given? ? yield(self[index]) : proc.call(self[index]) }
  end

  def my_map(proc = nil)
    size.times { |index| block_given? ? self[index] = yield(self[index]) : self[index] = proc.call(self[index]) }
  end

  def my_select(proc = nil)
    select_ary = []
    self.my_each do|element|
      if block_given?
        select_ary.push(element) if yield(element)
      else
        if proc
          select_ary.push(element) if proc.call(element)
        else
          return self.to_enum(:my_select)
        end
      end
    end
    select_ary
  end

  def my_all?(proc = nil)
    self.my_each do|element|
      if block_given?
        return false  unless yield(element)
      else
        if proc
          return false  unless proc.call(element)
        else
          return false if (element.nil? || element == false)
        end
      end
    end
    true
  end
end
