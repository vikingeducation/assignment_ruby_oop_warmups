class Array
  def my_each
    index = 0 
    while index < self.size 
      yield(self[index])
      index += 1 
    end 
    self 
  end 
end