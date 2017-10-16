require "./my_each.rb"

class Array
  def my_all?(proc_args = nil)
    self.my_each do |x|
      if block_given?
        return false unless yield(self[x])
      else
        return false unless proc.call(self[x])
      end
    end
  end
end


#my_proc = Proc.new{|item| item.even?}
#=> #<Proc:0x007fbb6b9c1ff8@(irb):2>
# [1,2,5].my_all?(my_proc)
#=> false