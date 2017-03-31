def fibonacci(number)
#takes a number
#returns that many numbers in the fibonacci sequence
  a = 0
  b = 1
  return_array = []
  (number).times do
    c = a
    a = b
    b = c + b
    return_array << c
  end
  print return_array
end

fibonacci(8)
