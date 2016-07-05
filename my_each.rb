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


end

# my_proc = Proc.new{|item| item.even?}
[1,2,5,4, 8, 9].my_select{|item| item.even?}