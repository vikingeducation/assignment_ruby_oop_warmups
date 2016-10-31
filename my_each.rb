class Array
  def my_each(my_proc = nil)
    length.times do |i|
      if my_proc != nil
        my_proc.call(self[i])
      elsif block_given?
        yield(self[i])
      else
        puts "You did not provide an opperator"
      end
    end
    p self
  end
end

my_proc = Proc.new{ |item| puts item }
[1,2,5].my_each(my_proc)
my_proc = Proc.new{ |item| puts item ** 2 }
[1,2,5].my_each(my_proc)