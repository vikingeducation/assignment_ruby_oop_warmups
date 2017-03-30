#my_each - does the same as Ruby's each method
class Array
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




end #end of class

#tests
my_array = Array.new([1,2,4,6])
my_array.my_each do |item|
  puts item * 10
end
my_proc = Proc.new {|item| puts item + 10}
my_array.my_each(&my_proc)

my_array.my_map {|item| puts "hello" * item}
my_array.my_map(&my_proc)
