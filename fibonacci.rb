def fibonacci(n_num, cache = {})
  if n_num == 0 || n_num == 1
    n_num
  else
    cache[n_num] ||= fibonacci(n_num - 1, cache) + fibonacci(n_num - 2, cache)
  end
end

def build_fib_seq(nth_place)
  fib_seq = []

  0.upto(nth_place) do |n|
    fib_seq << fibonacci(n)
  end

  fib_seq
end
