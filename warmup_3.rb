class Array
  #my_each - does the same as Ruby's each method  
  def my_each (*a_proc)
    current_index = 0
    until self.size == current_index
      if block_given?
        yield self[current_index]
      else
        a_proc.call self[current_index]
      end #end of if statement
      current_index += 1
    end #end of until
  end #end of my_each method


  #my_map - does same as Ruby's map method - can use my_each method to implement
  def my_map (*proc1)
  #returns a modified array, modified based on block or proc passed
    new_array = []
    self.my_each do |item|
      new_array << yield(item)
    end
    new_array
  end #end of my_map method


  #my_select - does same as Ruby's select method - returns a new array with any items for which provided block returned true
  def my_select (*proc1)
    new_array = []
    self.my_each do |item|
      if yield(item) == true
        new_array << item
      end
    end
    new_array
  end #end of my_select method


  #my_all? - works the same as Ruby's all? -takes a block or a proc - can use my_each to implement
  #passes each element of an Array to the given block, returns true if no element returns false or nil, otherwise returns false
  def my_all? (*a_proc)
    return_array = []

    self.my_each do |item|
      if yield(item) == true
        return_array << true
      else
        return_array << false
      end
    end

    if return_array.include? false
      return false
    else
      return true
    end
  end #end of my_all method


  #my_inject method - same function as Ruby's inject method - takes block or proc and can use my_each to implement
  #combines all elements of an array by applying a binary operation specified by a block or a proc
  def my_inject(*arg)
    starting_value = 0
    starting_value += arg
    self.length.times do
      self.my_each do |item|
        starting_value += yield(item)
      end
    end
    return starting_value
  end #end of my_inject method



end #end of class

#tests
my_array = Array.new([2,4,6,10,11,13])
my_array.my_each { |item| puts item * 10}

my_proc = Proc.new {|item| puts item + 10}
my_array.my_each(&my_proc)

my_array.my_map {|item| puts "hello" * item}
my_array.my_map(&my_proc)

another_proc = Proc.new {|item| item.even?}
print my_array.select(&another_proc)
print my_array.my_select(&another_proc)

print my_array.all?(&another_proc)
print my_array.my_all?(&another_proc)

print my_array.inject {|sum, item| sum + item}
print my_array.inject {|product, item| product - item}
print my_array.my_inject {|sum, item| sum + item}
print my_array.my_inject {|product, item| product - item}
