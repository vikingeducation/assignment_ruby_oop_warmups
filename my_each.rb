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

  def my_select
    new_arr = []
    self.my_each do |item|
      if yield(item)
         new_arr << item
      end   
    end
    new_arr
  end

  def my_all
    self.my_each do |item|
      if !yield(item)
         return false
      end   
    end
    true
  end

  def my_inject(cumm=0)
    self.my_each do |item|
      cumm = yield(cumm,item)
    end
    cumm
  end

end

# [3,4,5].my_each do |num|
#   puts num
# end
  
#test_arr = [3,4,5].my_map do |num|
#  num * 3
#end

#puts test_arr

#test_arr = [3,4,5,10,20].my_select do |num|
#  num < 10
#end

#puts test_arr


# result = [3,4,5,10,20].my_all do |num|
#   num < 10
# end
# puts result

# result = [3,4,5,1,2].my_all do |num|
#   num < 10
# end
# puts result

result = [3,4,10].my_inject() do |prod,num|
   prod + num
 end
puts result

