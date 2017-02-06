class Array

  def my_each(proc = nil)
    if block_given?
      self.count.times { |i| yield(self[i]) }
    else
      self.count.times { |i| proc.call(self[i]) }
    end
  end

  def my_map(proc = nil)
    map_arr = []

    if block_given?
      self.my_each { |i| map_arr.push(yield(i)) }
    else
      self.my_each { |i| map_arr.push(proc.call(i)) }
    end

    return map_arr
  end

end