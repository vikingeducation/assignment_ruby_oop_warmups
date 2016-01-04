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
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1    
    end
  end



  def my_map
    result = []
    self.my_each do |item|
      result << yield(item)
    end
    result
  end


  def my_select
    result = []
    self.my_each do |item|
      if yield(item) == true
        result << item
      end
    end
    return result
  end


  def my_all?
    self.my_each do |item|
      unless yield(item)
        return false
      end
    end
    true
  end



  def my_inject(memo)
    sum = memo
    self.my_each do |item|
      sum += yield(memo, item)
    end
    return sum
  end

end

[1,2,5].my_inject(7) do |memo, item|
  memo + item
end
