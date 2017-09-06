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



# Create a method my_select which extends the Array class and has identical
# functionality to Ruby's native select method. You can use your my_each method
# to implement this. Make it take either a block or a proc.
class Array
  def my_select(proc_argument = nil)
    selected_items = []
    self.my_each do |item|
      if block_given?
        selected_items << item if yield(item)
      else
        selected_items << item if proc_argument.call(item)
      end
    end
    p selected_items
  end
end

# takes a block
[1,2,5].my_select {|item| item.even?}

# takes a proc
my_proc = Proc.new{|item| item.even?}
[1,2,5].my_select(my_proc)



# Create a method my_all? which extends the Array class and works the same
# as Ruby's native all? method. You can use your my_each method to implement
# this. Make it take either a block or a proc.
class Array
  def my_all?(proc_argument = nil)
    selected_items = []
    self.my_each do |item|
      if block_given?
        selected_items << item if yield(item)
      else
        selected_items << item if proc_argument.call(item)
      end
    end
    p selected_items == self
  end
end

# takes a block
[1,2,5].my_all?{|item| item.even?}

# takes a proc
my_proc = Proc.new{|item| item.even?}
[1,2,5].my_all?(my_proc)
