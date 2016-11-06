class Array
  def my_map(my_proc = nil)
    length.times do |i|
      if my_proc != nil
        self[i] = my_proc.call(self[i])
      elsif block_given?
        self[i] = yield(self[i])
      else
        puts "You did not provide an operation"
      end
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