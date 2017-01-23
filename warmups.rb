def my_reverse(word)
  reversed = ""
  (word.length-1).downto(0) { |index| reversed += word[index] }
  reversed
end

puts my_reverse("hello")


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

def my_benchmark(number_of_times)
  #Ask Robert about how to use time
end 


