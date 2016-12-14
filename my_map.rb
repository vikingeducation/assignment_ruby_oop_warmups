class Array

  def my_map( item_block = nil)
    i = 0
    while i < self.size
      yield(self[i])    if block_given?
      item_block.call(self[i]) unless item_block == nil
      i += 1
    end
  end

end
