class Array
  def my_each(my_proc)
    i = 0
    length.times do
      my_proc.call(self[i])
      i += 1
    end
    p self
  end
end
my_proc = Proc.new{ |item| puts item }
[1,2,5].my_each(my_proc)
my_proc = Proc.new{ |item| puts item ** 2 }
[1,2,5].my_each(my_proc)