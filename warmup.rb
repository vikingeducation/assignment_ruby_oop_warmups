#################warmup1################

def reverse(str)
  array = str.split("")
  reverse_str = []
  while true
    break if array == []
    reverse_str
    reverse_str << array.pop
  end
 return reverse_str.join("")
end

#p reverse("hi what is your name")

def fibonacci(terms)
  array = []
  array << 0
  current_term = 1
  return if terms == current_term
  array << 1
  current_term = 2
  return array if terms == current_term
  while true
    break if array.count == terms
    a = array[-1]
    b = array[-2]
    c = a + b
    array << c
  end
  print array
end

#################warmup2################

def my_benchmark(number_of_times)
  start = Time.now
  time = 0
  while time < number_of_times
    yield
    time += 1
  end
  stop = Time.now
  return start - stop
end

#print my_benchmark(10){puts "hi"}

#################warmup3################

def my_each(arr)
  p arr
end

my_each(my_each)
