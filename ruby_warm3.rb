class Array
  def my_each(arg= nil)
    i = 0
    while i < self.length
      if block_given?
        yield(self[i])
      else
        arg.call(self[i])
      end
      i += 1
    end
  end

  def my_map(arg= nil )
    array_output=[]
    self.my_each do |i|
      if block_given?
        array_output << yield(i)
      else
        array_output << arg.call(self[i])
      end
    end
      return array_output
  end

  def my_select(arg= nil)
    array_output=[]
    self.my_each do |i|
      if block_given?
        array_output << i if yield(i)
      else
        array_output << i if arg.call(i)
      end
    end
    return array_output
  end

  def my_all?(arg= nil)
    fact= true
    self.my_each do |i|
      if block_given?
        fact= false if !yield(i)
      else
        fact= false if !arg.call(i)
      end
    end
      return fact
  end

  def my_inject(total= nil, arg= nil)
    self.my_each do |i|
      total = arg.call(total, i)
    end
    return total
  end
end



test=[2,4,6]

puts "#{test.inject{|memo, item| memo + item}} for #{test}."
