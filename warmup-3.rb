class Array
  def my_each(prc=nil)
    if block_given?
      self.each do |elem|
        yield(elem)
      end
    else
      self.each do |elem|
        prc.call(elem)
      end
    end

  end

  def my_map(prc=nil)
    mapped_array = []

    if block_given?
      self.each do |elem|
       mapped_array << yield(elem)
      end
    else
      self.each do |elem|
        mapped_array << prc.call(elem)
      end
    end

    mapped_array
  end

  def my_select(prc=nil)
    selected_array = []

    if block_given?
      self.each do |elem|
        selected_array << elem if yield(elem)
      end
    else
      self.each do |elem|
        selected_array << elem if prc.call(elem)
      end
    end
    selected_array
  end

  def my_all?(prc=nil)
    if block_given?
      self.each do |elem|
        return false if !yield(elem)
      end
    else
      self.each do |elem|
        return false if !prc.call(elem)
      end
    end
    return true
  end

  def my_inject(val, prc=nil)
    if block_given?
      self.each do |elem|
        val = yield(val, elem)
      end
    else
      self.each do |elem|
        val = prc.call(val, elem)
      end
    end
    val
  end

end

p [1,2,5].my_each{ |item| puts item }
my_proc = Proc.new{|item| puts item**2}

p [1,2,5].my_each(my_proc)

p [1,2,5].my_map { |item| item ** 2 }