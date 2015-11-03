module ArrayExtention

  def my_each proc=nil
    if block_given?
      self.length.times { |index| yield self[index] }
    else
      self.length.times { |index| proc.call self[index]}
    end
  end

  def my_map proc = nil
    result = []
    if block_given?
      self.my_each { |item| result << (yield item) }
    else
      self.my_each { |item| result << (proc.call item)}
    end
    result
  end

  def my_select proc = nil
    result = []
    if block_given?
      self.my_each { |item| result << item if (yield item) }
    else
      self.my_each { |item| result << item if (proc.call item) }
    end
    result
  end

  def my_all? proc = nil
    result = []
    if block_given?
      self.my_each { |item| result << item if (yield item) }
    else
      self.my_each { |item| result << item if (proc.call item) }
    end
    result.length == self.length
  end

  def my_inject initial_value=self.first, proc=nil
    memo = initial_value
    if block_given?
      self.my_each { |item| memo = yield(memo, item) }
    else
      self.my_each { |item| memo = proc.call(memo, item) }
    end
    memo
  end
end

class Array
  include ArrayExtention
end

# [1,2,5].my_each{ |item| puts item }
# my_proc = Proc.new{|item| puts item+2}
# # [1,2,5].my_each(my_proc)

# puts [1,2,5].my_map { |item| item ** 2 }
# puts [1,2,5].my_map(my_proc)

# my_proc = Proc.new{|item| item.even?}
# puts [1,2,5].my_select(my_proc).to_s
# puts [1,2,5].my_select{|item| item.even?}.to_s

# my_proc = Proc.new{|item| item.even?}
# puts [1,2,5].my_all?(my_proc)

puts [1,2,5,3].my_inject(0){ |memo, item|  memo + item }.to_s
puts [1,2,5,3].my_inject(1){ |memo, item|  memo * item }.to_s