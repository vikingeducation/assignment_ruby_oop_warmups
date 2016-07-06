def fibs(x)
  temp_arr = []

  x.times do |num|
    temp_arr[num] = calc_fib(num)
  end

  temp_arr
end

def calc_fib(a_number)
  a_number <= 1 ? a_number : calc_fib(a_number - 1) + calc_fib(a_number - 2)
end

print fibs(3), "\n"
print fibs(8), "\n"