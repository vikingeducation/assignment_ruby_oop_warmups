def my_reverse(str)
  new_str=""
  (str.length-1).downto(0).each {|num| new_str<<str[num]}
  new_str
end


def fibs(num)
  f=[0,1]
  (2..num-1).each {|n| f[n]=f[n-1]+f[n-2]}
  f
end

def my_benchmark(ntimes)
  start_time=Time.now
  ntimes.times {yield}
  Time.now - start_time
end

class Array
  def my_each(proc = nil)
    if block_given?
      for i in 0..self.size-1 do
        yield(self[i])   
      end
    else
      for i in 0..self.size-1 do
        proc.call(self[i])   
      end
    end
  end

  def my_map(proc = nil)
    arr=[]
    #Do it with my_each also
    #for i in 0..self.size-1 do
    #  arr<<yield(self[i]) 
    #end
    block_given? ? self.my_each {|item| arr<<yield(item)} : self.my_each {|item| arr<<proc.call(item)}
    arr
  end

  def my_select(proc = nil)
    arr=[]
    #for i in 0..self.size-1 do
    #  yield(self[i]) ? arr<<self[i] : next
    #end
    block_given? ?  self.my_each {|item| arr<<item if yield(item)} : self.my_each {|item| arr<<item if proc.call(item)}
    arr
  end

  def my_all?(proc = nil)
    #for i in 0..self.size-1 do
    #  return false unless yield(self[i])
    #end
    #return true
    block_given? ?  self.my_each {|item| return false unless yield(item) } : self.my_each {|item| return false unless proc.call(item) }
    return true
  end

  def my_inject(start, proc = nil)
    total=start
    #for i in 0..self.size-1 do
    #  total += self[i]
    #end
    #total
    block_given? ? self.my_each{|item| total = yield(total,item)} : self.my_each{|item| total = proc.call(total,item)} 
    total
  end
end




