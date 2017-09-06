class Array
  def my_each
    index = 0 
    while index < self.size 
      yield(self[index])
      index += 1 
    end 
    self 
  end 

  def my_map
    mapped_arr = []
    self.my_each { |elem| mapped_arr << yield(elem) }
    mapped_arr
  end
end