#!/usr/bin/ruby
require 'pry'

def my_reverse(str)
  len = str.size
  for i in 0..len/2
    temp = str[i]
    str[i] = str[len-1-i]
    str[len-1-i] = temp
  end
  str
end

p my_reverse "Blah!"

def fib(num)
  return 0 if num == 0
  return 1 if num == 1
  fib(num-1) + fib(num-2)
end

def fibs(num)
  fib_arr = []
  (0..num-1).each do |n|
    fib_arr << fib(n)
  end
  fib_arr
end

p fibs 3
p fibs 8