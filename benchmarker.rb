require 'time'
require 'pry'
# require 'byebug'

def my_benchmark number_of_times
  # byebug
  # binding.pry
  begin_time = Time.now
  number_of_times.times { yield }
  end_time = Time.now
  (begin_time - end_time) / number_of_times
end
