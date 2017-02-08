class Array
  def my_each (proc_argument = nil)
    if block_given?
      self.size.times do |item|
        yield self[item]
      end
    else
      self.size.times do |item|
        proc_argument.call self[item]
      end
    end
    self
  end
end