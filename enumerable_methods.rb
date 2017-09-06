# Create a method my_each which extends the Array class and
# has identical functionality to Ruby's native each method
# (obviously don't use each in the implementation). Make it
# take either a block or a proc.

class Array
  def my_each(proc_argument = nil)
    i = 0
    while i < self.length
      block_given? ? yield(self[i]) : proc_argument.call(self[i])
      i += 1
    end
  end
end

# accepts a block
[1,2,5].my_each{ |item| puts item }

# accepts a proc
putser_proc = Proc.new { |item| puts item }
[1,2,5].my_each(&putser_proc)


# Create a method my_map which extends the Array class and has identical
# functionality to Ruby's native map method. You can use your my_each method
# to implement this. Make it take either a block or a proc.
class Array
  def my_map(proc_argument = nil)
    mapped_array = []
    self.my_each do |item|
      block_given? ? mapped_array << yield(item) : mapped_array << proc_argument.call(item)
    end
    p mapped_array
  end
end

# takes a block
[1, 2, 5].my_map do |item|
  item ** 2
end

# takes a proc
squarer = Proc.new { |item| item ** 2 }
[1, 2, 5].my_map(&squarer)
