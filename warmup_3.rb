#my_each - does the same as Ruby's each method
class Array
  def my_each (*a_proc)
    iteration = 0
    until self.length == iteration
      if block_given?
        yield self[iteration]
      else
        a_proc.call self[iteration]
      end #end of if statement
      iteration += 1
    end #end of until
    self
  end #end of method
end #end of class


#test
my_array = Array.new([1,2,4,6])
my_array.my_each { |item| puts item * 10}
my_proc = Proc.new {|item| puts item + 10}
my_array.my_each(&my_proc)



#my_map - does same as Ruby's map method - can use my_each method to implement
def my_map


end #end of method
