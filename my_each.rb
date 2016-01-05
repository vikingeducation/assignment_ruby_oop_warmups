
class Array
  
  def my_each(my_proc=nil)
    self.length.times do |ind|
      if block_given?
         yield(self[ind])
      else 
         my_proc.call(ind)
      end   
    end  
  end

  def my_map(my_proc=nil)
    new_arr = []
    self.my_each do |item|
      if block_given?
          puts "GOT BLOCK!"
         new_arr << yield(item)
      else
         puts "GOT PROC!"
         new_arr << my_proc.call(item)
      end   
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

  def my_inject(acc=0)
    self.my_each do |item|
      acc = yield(acc,item)
    end
    acc
  end

end

#my_proc = Proc.new {|num| puts num} 
#[3,4,5,20].my_each(&my_proc)
# [3,4,5].my_each do |num|
#   puts num
# end

 my_proc = Proc.new {|num| num * 3}   
 test_arr = [3,4,5,20].my_map(&my_proc)
 puts test_arr
 
 test_arr = [3,4,5,20].my_map(my_proc)
# test_arr = [3,4,5].my_map do |num|
#   num * 3
# end

puts test_arr

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

# result = [3,4,10].my_inject() do |prod,num|
#    prod + num
#  end
# puts result

