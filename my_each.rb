class Array
  def my_each(my_proc)
    i = 0
    length.times do
      my_proc.call(self[i])
      i += 1
    end
    p self
  end
  def my_inject(start = 0, my_proc = nil)
    memo = start
    self.my_each(my_proc) do |i|
      my_proc.call(i)
    end
  end
end
=begin
my_proc = Proc.new{ |item| puts item }
[1,2,5].my_each(my_proc)
my_proc = Proc.new{ |item| puts item ** 2 }
[1,2,5].my_each(my_proc)
=end

my_proc = Proc.new {memo + item}

[1,2,5].my_inject(0, my_proc)
# do |memo, item|
 # memo + item
#end

