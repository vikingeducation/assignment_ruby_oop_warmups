#!/usr/bin/ruby

require 'pry'

def my_benchmark(number_of_iterations)
  start = Time.now
  number_of_iterations.times do
    yield
  end
  stop = Time.now
  duration = stop - start
  puts duration
end

my_benchmark(10000) {puts "hi"}
