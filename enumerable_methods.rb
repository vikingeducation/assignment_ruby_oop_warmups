class Array

  def my_each(my_proc = nil)
    my_enum = self.to_enum
    if block_given?
      loop do
        yield(my_enum.next)
      end
    elsif my_proc
      loop do
        my_proc.call(my_enum.next)
      end
    else
      my_enum
    end
  end

  def my_map(my_proc = nil)
    return self.to_enum if !block_given? && my_proc.nil?
    return_array = []
    self.my_each do |item|
      if block_given?
        return_array << yield(item)
      elsif my_proc
        return_array << my_proc.call(item)
      end
    end
    return_array
  end

  def my_select(my_proc = nil)
    return self.to_enum if !block_given? && my_proc.nil?
    return_array = []
    self.my_each do |item|
      if block_given?
        return_array << item if yield(item)
      elsif my_proc
        return_array << item if my_proc.call(item)
      end
    end
    return_array
  end

  def my_all?(my_proc = nil)
    self.my_each do |item|
      if block_given?
        return false unless yield(item)
      elsif my_proc
        return false unless my_proc.call(item)
      else
        return false if !item
      end
    end

    true
  end

  def my_inject(*args, &block)
    if args.length == 0
      total = nil
      method = block
    elsif args.length == 1
      if args.first.is_a? Symbol
        total = nil
        method = args.first.to_proc
      else
        total = args.first
        method = block
      end
    elsif args.length == 2
      total = args.first
      method = args[1].to_proc
    else
      raise ArgumentError, "wrong number of arguments"
    end

    self.my_each do |item|
      if total == nil
        total = item
      else
        total = method.call(total, item)
      end
    end

    total
  end
end

