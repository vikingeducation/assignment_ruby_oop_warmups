# Create a method my_each which extends the Array class and has identical functionality
# to Ruby's native each method (obviously don't use each in the implementation). Make it
# take either a block or a proc.

class Array
  def my_each(proc = nil)
    for i in (0..self.length - 1)
      if block_given?
        yield(self[i])
      elsif not proc.nil?
        proc.call(self[i])
      end
    end
  end
end



[1,2,5].my_each { |item| puts item }
# 1
# 2
# 5
#=> [1,2,5]

my_proc = Proc.new{ |item| puts item ** 2 }
[1,2,5].my_each(my_proc)
# 1
# 4
# 25
#=> [1,2,5]