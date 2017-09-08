class Array
  def my_each(proc_argument = nil)
    index = 0 
    while index < self.size 
      if block_given?
        yield(self[index])
      else
        proc_argument.call(self[index])
      end
      index += 1 
    end 
    self 
  end 

  def my_map(proc_argument = nil)
    if block_given?
      self.my_each { |elem| mapped_arr << yield(elem) }
    else 
      self.my_each { |elem| mapped_arr << proc_argument.call(elem) }
    end
    mapped_arr
  end

  def my_select(proc_argument = nil)
    selected_elems = []
    if block_given?
      self.my_each { |elem| selected_elems << elem if yield(elem) }
    else
      self.my_each { |elem| selected_elems << elem if proc_argument.call(elem) }
    end
    selected_elems
  end

   def my_all?(proc_argument = nil)
    if block_given
      self.my_each { |elem| return false if !yield(elem) }
    else
      self.my_each { |elem| return false if proc_argument.call(elem) }
    end
    true
  end

  def my_inject(total = 0, proc = nil)
    total = self[0] if total == 0
    if block_given?
      self.my_each { |elem| total = yield(total, elem) }
    else 
      self.my_each { |elem| total = proc.call(total, elem) }
    end
    total
  end
end

