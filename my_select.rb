class Array
  def my_select(proc = nil)
    array = []
    each do |i|
      array << i if proc.call(i)
    end
    array
  end
end 

my_proc = Proc.new{|item| item.even?}
z = [1,2,5].my_select(my_proc)
print z