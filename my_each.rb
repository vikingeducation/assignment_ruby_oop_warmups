class Array
  def my_each(proc_argument = nil)
    i = 0
    until i == self.length 
      if block_given?
        yield(self[i])
      else 
        proc_argument.call(self[i])
      end
    i+=1
    end
    self
  end
end

[1,2,5].my_each{ |item| puts item}
