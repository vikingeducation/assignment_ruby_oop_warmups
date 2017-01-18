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

  def my_each_with_index(proc=nil)

    if block_given?
      index = 0
      while index < self.length
        yield self[index], index
        index +=1
      end
    else
      index = 0
      while index < self.length
        proc.call(self[index], index)
        index +=1
      end
    end
  end


end
