class Array

  def my_each(&proc_argument)
    for x in self
        proc_argument.call x
    end
    return self
  end

  def my_map(&proc_argument)
    new_arr = []
    self.my_each{|x|new_arr << proc_argument.call(x)}
    return new_arr
  end

  def my_select(&proc_argument)
    new_arr = []
    self.my_each do|x|
      if proc_argument.call(x)
        new_arr << x
      end
    end
    return new_arr
  end

  def my_all?(&proc_argument)
    self.my_each do|x|
      if !proc_argument.call(x)
        return false
      end
    end
    return true
  end

  def my_inject(number = 0, &proc_argument)
    self.my_each do |x|
      number = proc_argument.call(number, x)
    end
    return number
  end
  
end