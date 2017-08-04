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
    self.my_each do |element|
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
    self.my_each do |element|
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

  def my_inject(*args)
    if args
      if args[0].class == Proc
        result = self[0]
        self[1...self.length].my_each do |element|
          result = args[0].call(result, element)
        end

      elsif args[0].class == Symbol
        result = self[0]
        self[1...self.length].my_each do |element|
          result = result.send(args[0].to_sym, element)
        end

      elsif args[0]
        result = args[0]
        if block_given?
          self.my_each do |element|
            result = yield(result, element)
          end
        else
          self.my_each do |element|
             result = result.send(args[1].to_sym, element)
          end
        end

      else
        if block_given?
          result = self[0]
          self[1...self.length].my_each do |element|
            result = yield(result, element)
          end
        else
          puts ("LocalJumpError: no block given")
        end
      end
    end
    return result
  end
end
