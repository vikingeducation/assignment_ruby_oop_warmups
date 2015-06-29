def my_reverse (str)

  arr = str.split('')

  result = []

  until arr.empty?

    result << arr.pop()

  end

  return result.join('')


end


# puts my_reverse("string")


def fib_helper(num)

  if num == 0

    return 0

  elsif num == 1

    return 1

  else 

    return fib_helper(num - 1) + fib_helper(num - 2) 

  end

end

def fibs (num)


  arr = []

  num.times do |value|

    arr.push(fib_helper(value))

  end

  return arr

end


# p fibs(8)

def my_benchmark(num)

  start_time = Time.now

  num.times do 

    yield

  end

  Time.now - start_time


end



puts my_benchmark(10000) {puts "hi"}






