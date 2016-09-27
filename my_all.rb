require "./my_each.rb"

class Array
  def my_all?(proc_args = 0)
    bool = nil
    self.my_each do |x|
      bool = proc_args.call(x)
      break if bool == false
    end
    bool
  end
end


#my_proc = Proc.new{|item| item.even?}
#=> #<Proc:0x007fbb6b9c1ff8@(irb):2>
# [1,2,5].my_all?(my_proc)
#=> false