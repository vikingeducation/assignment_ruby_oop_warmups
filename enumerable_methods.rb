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
end
