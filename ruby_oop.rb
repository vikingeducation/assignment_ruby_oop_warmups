def my_reverse(string)
  reverse_string = ""
  string_array = string.split("")

  string_array.length.times do
    reverse_string += string_array.pop()
  end
  reverse_string
end
# my_reverse("garrett")


def fibs(num)
  fib_array = [0,1]
  if num == 1
    fib_array[0].to_a
  elsif num == 2
    fib_array
  else num > 2
    (num-2).times do
      fib_array.push(fib_array[-1] + fib_array[-2])
    end
  end
  fib_array
end
 #p fibs(8)

def my_benchmark(num_times)
  t1= Time.now
  num_times.times do
    yield
  end
  time = Time.now - t1
end

puts my_benchmark(10000) { puts "hi" }