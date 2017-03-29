def fibonacci(number)
  fibonacci_numbers = [1, 1]

  if number == 1
    fibonacci_numbers = [1]
  elsif number == 2
    fibonacci_numbers = [1, 1]
  else
    (2..number-1).each { |index| fibonacci_numbers << fibonacci_numbers[index-2] + fibonacci_numbers[index-1] }
  end

  return fibonacci_numbers
end
