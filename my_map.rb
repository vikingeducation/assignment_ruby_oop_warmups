class Array
  def my_map
    new_arr = []
    self.size.times do |i|
      new_arr << yield(self[i])
    end
    new_arr
  end
end

#[1,2,5].my_map do |item|
#   item ** 2
#end
#=> [1,4,25]