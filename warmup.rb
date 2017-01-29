def my_reverse(string)
  len = string.length
  chars = string.chars
  output = []

  len.downto(0) { |index| output << chars[index] }

  output.join
end

def fibonacci(number)
  if number == 1
    0
  elsif number == 2
    1
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

def fibs(numbers)
  result = []
  1.upto(numbers) { |number| result << fibonacci(number) }

  result
end

def my_benchmark(number_of_times)
  return 0 if number_of_times <= 0
    
  if block_given?
    before = Time.now
    number_of_times.times { |iteration| yield }
    after = Time.now

    after - before
  else
    0
  end
end
