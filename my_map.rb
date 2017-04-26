#!/usr/bin/ruby

require 'pry'
require_relative 'my_each'

class Array
  def my_map(&proc)
    new_arr = []
    self.my_each do |num|
      new_arr << proc.call(num)
    end
    new_arr
  end
end

# print [1,2,5].my_map { |item| item ** 2 }
