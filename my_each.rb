class Array
  def my_each
    self.length.times do |ind|
      yield(self[ind])
    end
  end

  def my_map
    new_arr = []
    self.my_each do |item|
      new_arr << yield(item)
    end
    new_arr
  end
end

# [3,4,5].my_each do |num|
#   puts num
# end
  
test_arr = [3,4,5].my_map do |num|
  num * 3
end

puts test_arr
