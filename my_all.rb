require_relative 'my_each'

class Array
  def my_all?(proc = nil, &block)
    if block_given?
      self.my_each do |x|
        if block.call(x) == false
           puts "false"
           break
        end
         puts "true"
       end
    else
      self.my_each do |x|
        if proc.call(x) == false
          puts "false"
          break
        end
        puts "true"
      end
    end
  end
end

my_proc = Proc.new{|item| item.even?}
[1, 2, 5].my_all?(my_proc)
