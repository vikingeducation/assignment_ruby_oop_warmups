require_relative 'my_each'

class Array
  def my_map(proc = nil, &block)
    map_arr = []
    if block_given?
      self.my_each do |x|
        map_arr << block.call(x)
      end
    else
      self.my_each do |x|
        map_arr << proc.call(x)
      end
    end
    puts map_arr.inspect
  end
end

[1, 2, 5].my_map do |item|
  item ** 2
end
