# oop_warmup.rb
require 'pry'

def my_reverse(word)
  arr = word.split('')
  new_word = ''
  (arr.length - 1).downto(0) do |i|
    new_word += arr[i]
  end
  new_word
end

def fibs(num)
  arr = []
  0.upto(num - 1) do |i|
    arr << if arr.length < 2
             i
           else
             arr[i - 1] + arr[i - 2]
           end
  end
  arr
end

def my_benchmark(number_of_times)
  start_time = Time.now
  number_of_times.times { yield }
  total_time = Time.now - start_time
  total_time
end

class Array
  def my_each
    0.upto(length - 1) do |i|
      yield self[i]
    end
    self
  end

  def my_map
    result = []
    my_each do |ele|
      result << yield(ele)
    end
    result
  end

  def my_select
    result = []
    my_each do |ele|
      result << ele if yield(ele)
    end
    result
  end

  def my_all?
    result = true
    my_each do |ele|
      result = false unless yield(ele)
    end
    result
  end

  def my_inject(val = nil)
    result = val
    my_each do |ele|
      result = result.nil? ? ele : yield(result, ele)
    end
    result
  end
end
#
# [1, 2, 5].my_each { |item| puts item }
# [1, 2, 5].my_map do |item|
#   item**2
# end
# [1, 2, 5].my_select(&:even?)
# [2, 2, 5].my_all?(&:even?)
#
# [1, 2, 5].my_inject(0) do |memo, item|
#   memo + item
# end
#
# [1, 2, 5, 1].my_inject do |memo, item|
#   memo + item
# end
