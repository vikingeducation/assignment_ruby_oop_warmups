#clone of ruby's each method
class Array
  def my_each(proc=nil)

    if block_given?
      index = 0
      while index < self.length
        yield self[index]
        index +=1
      end
    else
      index = 0
      while index < self.length
        proc.call(self[index])
        index +=1
      end
    end
  end
end



[1,2,3].my_each { |item| puts item }
my_proc = Proc.new{|item| puts item**2}
[1,2,5].my_each(my_proc)
