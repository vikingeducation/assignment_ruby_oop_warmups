class Array

  def my_each(proc_arg = self)
    if block_given?
      n = 0
      while n < self.length
        yield (self[n])
        n += 1
      end
    else
      proc_arg.call
    end
    self
   end