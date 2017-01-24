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
      yield
    end
  end_time = Time.now
  final = end_time - start_time
  puts "This took #{final}."
end

my_benchmark(10) { puts "hello"}


def my_each()
end 

def my_map()
end

def my_select()
end

def my_all?()
end

def my_inject()
end

