class Array
  def my_each(&block)
    (self.length).times do |x|
      block.call(self[x])
    end
  end
  
  def my_each(my_proc)
    puts my_proc
  end
end

[1,2,5].my_each{ |item| puts item }

my_proc = Proc.new{|item| puts item**2}
[1,2,5].my_each(my_proc)
