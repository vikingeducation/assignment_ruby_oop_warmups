class Array

  def my_each(prc=nil)
    counter = 0
    if block_given?
      while counter < length
        yield self[counter]
        counter += 1
      end
    else
      return nil if !prc
      while counter < length
        prc.call self[counter]
        counter += 1
      end
    end
    self
  end

  def my_map(&block)
    result = []
    my_each { |e| result.push (block.call e)}
    result
  end

  def my_select(&block)
    result = []
    my_each { |e| result.push e if block.call(e) }
    result
  end

  def my_all?(&block)
    my_each { |e| return false if !block.call(e) }
    return true
  end

  def my_inject(start, &block)
    current = start
    my_each { |e| current = block.call(current,(e)) }
    current
  end

end
