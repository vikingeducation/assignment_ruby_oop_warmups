class Array

  def my_each( proc = nil )
    if block_given?
      self.count.times { |i| yield(self[i]) }
    else
      self.count.times { |i| proc.call(self[i]) }
    end
  end

end