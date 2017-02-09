require_relative 'my_each'
require 'pry'

class Array
  def my_map(proc = nil, &block)
    map_arr = []
    if block_given?
      self.my_each do |x|
        map_arr << block.call(x)
      end
      puts map_arr
    else
      self.my_each do |x|
        map_arr << proc.call(x)
      end
      puts map_arr
    end
  end
end

[1,2,5].my_map do |item|
  item ** 2
 end
