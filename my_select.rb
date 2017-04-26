#!/usr/bin/ruby

require 'pry'
require_relative 'my_each'

class Array
  def my_select(&proc)
    new_arr = []
    self.my_each do |num|
      new_arr << num if proc.call(num) == true
    end
    new_arr
  end
end

my_proc = Proc.new{|item| item.even?}

#print [1,2,5].my_select(&my_proc)
