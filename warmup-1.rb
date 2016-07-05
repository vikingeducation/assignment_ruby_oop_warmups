def my_reverse(string)
  reversed_string = ""

  string.each_char do |char|
    reversed_string = char + reversed_string
  end

  reversed_string
end

#puts my_reverse("Hello")

def my_fib(n)
  n == 1 ?  fib_seq = [0] : fib_seq = [0, 1]
  while fib_seq.length < n
    fib_seq = fib_seq << fib_seq[-1] + fib_seq[-2]
  end
  fib_seq
end

#puts my_fib(10)

def my_benchmark(n)
  start = Time.now

  n.times do 
    yield
  end

  finish = Time.now

  finish - start
end

puts my_benchmark(10000) { puts "hi" }

class Array
  def my_each(prc=nil)
    if block_given?
      self.each do |elem|
        yield(elem)
      end
    else
      self.each do |elem|
        prc.call(elem)
      end
    end

  end

  def my_map(prc=nil)
    mapped_array = []
    
    if block_given?
      self.each do |elem|
       mapped_array << yield(elem)
      end
    else
      self.each do |elem|
        mapped_array << prc.call(elem)
      end
    end

    mapped_array
  end

  def my_select(prc=nil)
    selected_array = []

    if block_given?
      self.each do |elem|
        selected_array << elem if yield(elem)
      end

  end

end

p [1,2,5].my_each{ |item| puts item }
my_proc = Proc.new{|item| puts item**2}

p [1,2,5].my_each(my_proc)

p [1,2,5].my_map { |item| item ** 2 }


