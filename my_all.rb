class Array
  def my_all?(my_proc = nil)
    length.times do |i|
      if my_proc != nil
        if my_proc.call(self[i]) == false
          return p false
        end
      elsif block_given?
        if yield(self[i]) == false
          return p false
        end
      else
        return p "You did not provide a parameter"
      end
    end
    return p true
  end
end

my_proc = Proc.new{ |item| item % 3 == 0 }
[1,2,3,4,5,6].my_all?(my_proc)
my_proc = Proc.new{ |item| item.odd? }
[1,2,3,4,5,6].my_all?(my_proc)
[1,2,3,4,5,6].my_all? do |item|
  item % 3 == 0
end
[1,2,3,4,5,6].my_all? do |item|
  item.odd?
end
[1,2,5].my_all?