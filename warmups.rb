def my_reverse(word)
  reversed = ""
  (word.length-1).downto(0) { |index| reversed += word[index] }
  reversed
end

puts my_reverse("hello")


def fibonacci(number_stop)
  if number_stop == 1
    return [0]
  end
  fib_array = [0, 1]
  until fib_array.length == number_stop do
    add = fib_array[-1] + fib_array[-2]
    fib_array.push(add)
  end
  fib_array
end

puts fibonacci(4)

def my_benchmark(number_of_times)
  start_time = Time.now
    number_of_times.times do
      puts "hello"
    end
  end_time = Time.now
  final = end_time - start_time
  puts "This took #{final}."
end

my_benchmark(15) 


class Array 

  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end

end

array = [1,2,3]
array.my_each { |num| puts num*2 } 
puts array.inspect


class Array 

  def my_inject(start=nil, &block) 
    start = self[0] if start.nil? 
    i = 0
    total = start
    while i < self.length
      total = yield(total, self[i]) 
      i += 1
    end
    total
  end

end

array = [1,2,3]

puts array.my_inject(0) do |memo, item| 
  memo + item 
end



class Array 

  def my_map(&block) 
    i = 0
    arr = []
    while i < self.length
      arr.push(yield(self[i]))
      i += 1
    end
    arr
  end

end

array = [1,2,3]
array.my_map { |num| puts num*2 } 
puts array.inspect



class Array 

  def my_select(&block) 
    i = 0
    arr = []
    while i < self.length
      if yield(self[i])  
        arr.push(self[i])
      end
      i += 1
    end
    arr
  end

end

array = [1,2,3,5,6,4,8,9]
puts array.my_select { |num| num % 2 == 0} 

class Array 

  def my_select(&block) 
    i = 0
    arr = []
    while i < self.length
      if yield(self[i])  
        arr.push(self[i])
      end
      i += 1
    end
    arr
  end

end

array = [1,2,3,5,6,4,8,9]
puts array.my_select { |num| num.even? } 