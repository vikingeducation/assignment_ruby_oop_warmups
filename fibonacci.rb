#!/usr/bin/ruby

require 'pry'

def fibs(number_of_elements)
  @array = [0, 1]

  case number_of_elements
    when 1
      puts "[1]"
    when 2
      puts "#{@array}"
    else
      (number_of_elements - 2).times do |num|
        @array << (@array[num] + @array[num.next])
      end
  end
  puts "#{@array}"
end

fibs(3)
fibs(8)
