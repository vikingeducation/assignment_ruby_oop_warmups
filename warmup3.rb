class Array
  def my_each(my_proc=nil)
    0.upto(self.length-1) do |i| 
      if block_given?
        yield(self[i]) 
      else
        my_proc.call(self[i])
      end
    end
  end

  def my_map(my_proc=nil)
    new_array = []
    self.my_each do |i|
      if block_given?
        new_array << yield(i)
      else
        new_array << my_proc.call(i)
      end
    end
    new_array
  end

  def my_select(my_proc=nil)
    new_array = []
    self.my_each do |i|
      if block_given?
          new_array << i if yield(i)
      else
          new_array << i if my_proc.call(i)
      end
    end
    new_array
  end

  def my_all?(my_proc=nil)
    new_array = []
    self.my_each do |i|
      if block_given?
          return false unless yield(i)
      else
          return false unless my_proc.call(i)
      end
    end
    true
  end

  def my_inject(end_value=nil, my_proc=nil)
    end_value ||= self[0]
    self.my_each do |i|
      if block_given?
        end_value = yield(end_value, i)
      else
        end_value = my_proc.call(end_value, i)
      end
    end
    puts end_value
  end
end

# each test, block
# [1,2,5].my_each { |item| puts item}

# each test, proc
# my_proc = Proc.new { |item| puts item}
# [1,2,5].my_each my_proc

# map test, block
# puts [1,2,3,4].my_map { |i| i*i }

# select test, proc
# my_proc = Proc.new{|item| item.even?}
# puts [1,2,5].my_select(my_proc)

# all test block
# puts [2,4].my_all? { |item| item.even? }

# inject test block
# [1,2,5].my_inject(0) do |memo, item|
#   memo + item
# end