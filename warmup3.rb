class Array
  def my_each
    counter = 0
    while counter < self.count
      my_proc.call(self[counter])
      counter += 1
    end
  end
end

my_proc = Proc.new { |item| puts item }

[1,2,5].my_each(my_proc)
