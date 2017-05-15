# Create a method my_map which extends the Array class and has identical functionality
# to Ruby's native map method. You can use your my_each method to implement this. Make
# it take either a block or a proc.

class Array
  def my_map(proc = nil)
    new_array = []
    for i in (0..self.length - 1)
      if block_given?
        new_array.push(yield(self[i]))
      elsif not proc.nil?
        new_array.push(proc.call(self[i]))
      else
        new_array.push(self[i])
      end
    end
    return new_array
  end
end



p [1,2,5].my_map do |item|
  item ** 2
end
#=> [1,4,25]