# Create a method my_all? which extends the Array class and works the same as Ruby's
# native all? method. You can use your my_each method to implement this. Make it take
# either a block or a proc.

class Array
  def my_all?(proc = nil)
    result = true
    for i in (0..self.length - 1)
      if block_given?
        result = false if not yield(self[i])
      elsif not proc.nil?
        result = false if not proc.call(self[i])
      end
    end
    result
  end
end


puts [1, 2, 5].my_all? do |item|
  item < 10
end
#=> true

my_proc = Proc.new{|item| item.even?}
puts [1, 2, 5].my_all?(my_proc)
#=> false