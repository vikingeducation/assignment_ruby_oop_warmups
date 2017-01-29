def my_reverse(string)
  len = string.length
  chars = string.chars
  output = []

  len.downto(0) { |index| output << chars[index] }

  output.join
end

def fibonacci(number)
  if number == 1
    return 0
  elsif number == 2
    return 1
  else
    return fibonacci(number - 1) + fibonacci(number - 2)
  end
end

def fibs(numbers)
  result = []
  1.upto(numbers) { |number| result << fibonacci(number) }

  result
end