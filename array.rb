class Array
  def my_each my_proc=nil
    self.length.times do |num|
      if block_given?
        yield(self[num])
      else
        my_proc.call(self[num])
      end
    end
    self
  end

  def my_map 
    new_arr = []
    self.my_each { |item| new_arr << yield(item) }
    new_arr    
  end

  def my_select
    new_arr = []
    self.my_each { |item| new_arr << item if yield(item) }
    new_arr
  end

  def my_all?
    self.my_each { |item| return false unless yield(item) }
    return true
  end

  def my_inject(initial_val = 0)
    
  end
end

# [1,2,5].my_each { |item| puts item}
# my_proc = Proc.new { |item| puts item}

# [1,2,5].my_each my_proc

# puts [1,2,3,4].my_map { |i| i*i }

puts [2,4].my_all? { |item| item.even? }







