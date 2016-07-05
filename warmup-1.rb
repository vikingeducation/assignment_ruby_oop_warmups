


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




