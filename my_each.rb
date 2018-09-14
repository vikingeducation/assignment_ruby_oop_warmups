class Array
  def my_each( proc = nil, &block)
    if block_given?
      (self.length).times do |x|
        block.call(self[x])
      end
    else
      (self.length).times do |x|
        proc.call(self[x])
      end
    end
  end
end

[1, 2, 5].my_each{ |item| puts item }

my_proc = Proc.new{|item| puts item ** 2}
[1, 2, 5].my_each(my_proc)
