class Array

  def my_map( item_block = nil)
    i = 0
    arr = []
    while i < self.size
      arr << yield(self[i])  if block_given?
      arr << item_block.call(self[i]) unless item_block == nil
      i += 1
    end
  end
  arr
end


arr = [1,2,5]
arr.my_map do |item|
  item ** 2
end
