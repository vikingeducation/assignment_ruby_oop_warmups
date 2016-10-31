class Array
  def my_each(my_proc)
    i = 0
    self.length.times do
      yield self[i]
      i += 1
    end
    p self
  end
end
my_proc = {|item| puts item}
[1,2,5].my_each(my_proc)