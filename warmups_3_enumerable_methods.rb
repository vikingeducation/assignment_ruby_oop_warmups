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

    map_arr
  end

  def my_select(proc = nil)
    select_arr = []

    if block_given?
      self.my_each do |i|
        select_arr.push(i) if yield(i)
      end
    else
      self.my_each do |i|
        select_arr.push(i) if proc.call(i)
      end
    end

    select_arr
  end

  def my_all?(proc = nil)
    if block_given?
      self.my_each do |i|
        return false unless yield(i)
      end
    else
      self.my_each do |i|
        return false unless proc.call(i)
      end
    end

    true
  end

end