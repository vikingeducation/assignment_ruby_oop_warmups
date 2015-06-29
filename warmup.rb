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
  def my_each
    i = 0
    while i <self.size
      yield(self[i])
      i += 1
    end
  end
end