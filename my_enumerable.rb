
class Array


# Create a method my_each which extends the Array class and has identical functionality to Ruby's native each method (obviously don't use each in the implementation). Make it take either a block or a proc.

# We make the proc optional so it works when a block only is passed
  def my_each( proc_argument = nil )
    i = 0
    
    while i < self.size
      if block_given? 
        yield(self[i])   
      else
        proc_argument.call(self[i])
      end
      i+=1
    end
    # Return the original object like each
    self
  end

  # Test
# > [1,2,5].my_each{ |item| puts item }
# 1
# 2
# 5
#=> [1,2,5]
# > my_proc = Proc.new{|item| puts item**2}
#=> #<Proc:0x007fbb6b9c1cc8@(irb):2>
# > [1,2,5].my_each(my_proc)
# 1
# 4
# 25
#=> [1,2,5]


  # Create a method my_map which extends the Array class and has identical functionality to Ruby's native map method. You can use your my_each method to implement this. Make it take either a block or a proc.
  # Creates a new array containing the values returned by the block.
  def my_map( proc_argument = nil )
      result = []

      my_each do |element|
        if block_given? 
          result << yield(element)
        else
          result << block.call(element)
        end
      end
      result
  end

  # Test
  # > [1,2,5].my_map do |item|
  # >   item ** 2
  # > end
  #=> [1,4,25]


  # Create a method my_select which extends the Array class and has identical functionality to Ruby's native select method. You can use your my_each method to implement this. Make it take either a block or a proc.
  # Returns a new array containing all elements of ary for which the given block returns a true value.
  def my_select( proc_argument = nil )
    result = []

    my_each do |element|
      if block_given? 
        result << element if yield(element)
      else
        result << element if proc_argument.call(element)
      end
    end
    result
  end


  # Create a method my_all? which extends the Array class and works the same as Ruby's native all? method. You can use your my_each method to implement this. Make it take either a block or a proc.
  def my_all?( proc_argument = nil )
    result = []

    my_each do |element|
      if block_given? 
        result << element if yield(element)
      else
        result << element if proc_argument.call(element)
      end
    end

    # If the new array has the same number of true elements as the original array, we know that all elements satisfied the condition
    self.size == result.size ? true : false
  end


  # Create a method my_inject which extends the Array class and works the same as Ruby's native inject method. You can use your my_each method to implement this. Make it take either a block or a proc.
  def my_inject( num=0, proc_argument = nil )
    
    # Initial vlue
    result = num

    my_each do |element|
      if block_given? 
        result = yield(result, element)
      else
        result = proc_argument.call(result, element)
      end
    end
    result
  end


end
