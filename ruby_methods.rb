require 'pry'

def my_reverse input_str
  # binding.pry
  result = []
  input_str.split("").each do |letter|
    result.unshift letter
  end
  result.join
end

def fib n
  return 0 if n == 1
  return 1 if n == 2
  fib(n - 1) + fib(n - 2)
end

def fibs n
  # binding.pry
  (1..n).map {|value| fib value }
end
