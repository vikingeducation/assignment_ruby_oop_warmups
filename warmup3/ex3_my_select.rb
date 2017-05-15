# Create a method my_select which extends the Array class and has identical functionality
# to Ruby's native select method. You can use your my_each method to implement this. Make
# it take either a block or a proc.

class Array
  def my_select(proc = nil)
    new_array = []
    for i in (0..self.length - 1)
      if block_given?
        new_array.push(self[i]) if yield(self[i])
      elsif not proc.nil?
        new_array.push(self[i]) if proc.call(self[i])
      end
    end
    return new_array
  end
end



my_proc = Proc.new{ |item| item.even? }
p [1, 2, 5].my_select(my_proc)
#=> [2]