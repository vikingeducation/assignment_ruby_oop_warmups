#!/usr/bin/ruby

require 'pry'

def my_reverse(string)
  @i = 0
  @length = string.length
  @reversed = []
  @array = string.split(//)

  @length.times do
   @reversed << @array.pop
  end

  @new_string = @reversed.join

end

puts my_reverse("Blah!")
