class Array
#[1,2,5]
  def my_each(&block)
    index = 0
    while index < self.length
      yield self[index]
      index += 1
    end
    self
  end

  def my_map(&block)
    temp_arr = []
    self.my_each {|num| temp_arr << yield(num)}
    print temp_arr, "\n"
  end


  def my_select(&block)
    temp_arr = []
    self.my_each {|num| temp_arr << num if yield(num)}
    print temp_arr, "\n"
  end

  def my_all?(&block)
    self.my_each {|num| yield(num) ? next : (return false)}
    true
  end

  def my_inject(start_num=0, &block)
    temp_num = start_num
    self.my_each{|num| temp_num += yield(0, num)}
    temp_num
  end
end

# my_proc = Proc.new{|item| item.even?}
# [1,2,5,4, 8, 9].my_select(&my_proc)

# my_proc = Proc.new{|item| item.even?}
# puts [2,4,6].my_all?(&my_proc)
puts [1,2,5].my_inject(0){|memo, item| memo + item }
