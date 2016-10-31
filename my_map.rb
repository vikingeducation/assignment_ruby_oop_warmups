class Array
  def my_map(my_proc = nil)
    if my_proc != nil
      i = 0
      length.times do
        self[i] = my_proc.call(self[i])
        i += 1
      end
      p self
    elsif block_given?
      i = 0
      length.times do
        self[i] = yield(self[i])
        i += 1
      end
      p self
    else
      puts "You did not provide an operation"
    end
  end
end

my_proc = Proc.new{ |item| item }
[1,2,5].my_map(my_proc)
my_proc = Proc.new{ |item| item ** 2 }
[1,2,5].my_map(my_proc)
[1,2,5].my_map do |item|
  item ** 2
end
[1,2,5].my_map do |item|
  item
end
[1,2,5].my_map