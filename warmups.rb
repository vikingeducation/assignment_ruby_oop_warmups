def  my_reverse(word)
  word.reverse
end

puts my_reverse("blah")


def fibonacci(number_stop)
  if number_stop == 1
    return [0]
  end
  fib_array = [0, 1]
  until fib_array.length == number_stop do
    add = fib_array[-1] + fib_array[-2]
    fib_array.push(add)
  end
  fib_array
end

puts fibonacci(4)