def fibonacci(elements)
  fib_array = [0 , 1]
  print "["
  elements.times do |i|
    print "#{fib_array[0,1]}"
    if i == (elements - 1)
      puts "]"
    else
      print ", "
    end
    sum = fib_array[0] + fib_array[1]
    fib_array[0] = fib_array[1]
    fib_array[1] = sum
  end
end

fibonacci(3)
fibonacci(8)
