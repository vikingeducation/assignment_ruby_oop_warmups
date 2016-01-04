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
end
[1,2,5].my_each{ |item| puts item }

