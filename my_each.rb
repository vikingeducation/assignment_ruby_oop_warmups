#!/usr/bin/ruby

require 'pry'

class Array
  def my_each(&proc)
    self.length.times { |num| proc.call(self[num]) }
  end
end

# [1,2,5].my_each{ |item| puts item }

# my_proc = Proc.new{ |item| puts item**2 }

# [1,2,5].my_each(&my_proc)
