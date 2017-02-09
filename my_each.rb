class Array
  def my_each (proc_argument = nil)
    self.size.times do |item|
      if block_given?
        yield self[item]
      else
        proc_argument.call self[item]
      end
    end
    self
  end
end