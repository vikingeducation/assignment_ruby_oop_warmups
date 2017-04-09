class Array
  def my_each(proc_argument=nil)
    i = 0
    if block_given?
      while i < self.length do
        yield(self[i])
        i += 1
      end
      self
    else
      while i < self.length do
        proc_argument.call(self[i])
        i += 1
      end
    end
  end
end


[1,2,3].my_each { |x| puts("Hi #{x}") }

y_proc = Proc.new{|item| puts item**2}

[11,22,33].my_each(y_proc)
