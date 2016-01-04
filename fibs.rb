def fibs(number)
  fibonacci_array = Array.new
  if number == 0
    return [0]
  elsif number == 1
    return [0, 1]
  else
    new_element = fibs(number-1) + fibs(number-2)
    fibonacci_array += new_element
  end
  fibonacci_array
end