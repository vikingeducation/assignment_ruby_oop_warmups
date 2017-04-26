#!/usr/bin/ruby

require 'pry'
require_relative 'my_each'

class Array
  def my_all?(&proc)
    self.my_each do |num|
      if proc.call(num) != true
        return false
      end
      return true
    end
  end
end

my_proc = Proc.new{|item| item.even?}

[1,2,5].my_all?(&my_proc)
[2,4,6].my_all?{|item| item.even?}
