class Array
  def my_select(proc_args = self)
    arr = []
    self.size.times do |i|
      arr << self[i] if proc_args.call(self[i])
    end
    arr
  end
end


=begin
solution for block only
class Array
  def my_select(proc_args = self)
    arr = []
    self.size.times do |i| 
      arr << self[i] if yield(self[i])
    end
    arr
  end
end
=end



#my_proc = Proc.new{|item| item.even?}
#=> #<Proc:0x007fbb6b9c1ff8@(irb):2>
#[1,2,5].my_select(my_proc)
#=> [2]