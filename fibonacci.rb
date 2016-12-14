def fibonacci(num)
  fib = [0,1]
  while fib.size < num
    fib << fib[-1] + fib[-2]
  end
  fib
end
