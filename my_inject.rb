#!/usr/bin/ruby

require 'pry'
require_relative 'my_each'

class Array
  def my_inject(&proc)
    item = self.shift
    self.my_each do |num|
      item = proc.call(item,num)
    end
    item
  end
end

[1,2,5].my_inject do |memo, item|
    memo + item
  end
