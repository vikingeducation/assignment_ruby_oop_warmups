class Array
  def my_select(my_proc = nil)
    return_array = []
    length.times do |i|
      if my_proc != nil
        if my_proc.call(self[i])
          return_array << self[i]
        end
      elsif block_given?
        if yield(self[i])
          return_array << self[i]
        end
      else
        puts "You did not provide a parameter"
      end
      p return_array
    end
  end
end

my_proc = Proc.new{ |item| item % 3 == 0 }
[1,2,3,4,5,6].my_select(my_proc)
my_proc = Proc.new{ |item| item.odd? }
[1,2,3,4,5,6].my_select(my_proc)
[1,2,3,4,5,6].my_select do |item|
  item % 3 == 0
end
[1,2,3,4,5,6].my_select do |item|
  item.odd?
end
[1,2,5].my_select