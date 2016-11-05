class Array
  def my_all?(proc = nil)
    each do |i|
      unless proc.call(i)
        false    
      end
    end
    true
  end
end



my_proc = Proc.new{|item| item.even?}
#=> #<Proc:0x007fbb6b9c1ff8@(irb):2>
puts [1,2,5].my_all?(my_proc)
#=> false