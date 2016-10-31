class Array
  def my_each(proc = nil)
    size.times do |i|
      if block_given?
        yield (self[i])
      else
        proc.call(self[i])
      end
    end
  end
end 

[1,2,5].my_each{ |item| puts item }

my_proc = Proc.new{|item| puts item**2}
[1,2,5].my_each(my_proc)