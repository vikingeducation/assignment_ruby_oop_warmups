class Array

  def my_each(&proc)
    index = 0
    while index < self.size
      proc.nil? ? yield(self[index]) : proc.call(self[index])
      index += 1
    end
  end

  def my_map(&proc)
    mapped = [ ]
    if block_given?
      self.my_each { |value| mapped << yield(value) }
    else
      self.my_each { |value| mapped << proc.call(value) }
    end
    mapped
  end

  def my_select(&proc)
    selected = [ ]
    if block_given?
      self.my_each { |value| selected << value if yield(value) }
    else
      self.my_each { |value| selected << value if proc.call(value) }
    end
    selected
  end

  def my_all?(&proc)
    true_array = [ ]
    if block_given?
      self.my_each { |value| true_array << value if yield(value) }
    else
      self.my_each { |value| true_array << value if proc.call(value)}
    end
    true_array.size == self.size
  end

  def my_inject(&proc)
    result = self
    while result.size > 1
      a = result.shift
      b = result.shift
      if block_given? 
        result.unshift(yield(a, b))
      else
        result.unshift(proc.call(a, b))
      end
    end
    result.join("")
  end

end