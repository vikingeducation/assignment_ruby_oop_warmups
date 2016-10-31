class Array
  def my_inject(start = 0, my_proc = nil)
    memo = start
    length.times do |i|
      if my_inject != nil
        my_proc.call(self[i])
      elsif block_given?
        yield(self[i])
      else
        return puts "You did not provide an operation"
      end
    end
    p memo
  end
end

[1,2,5].my_inject(0) do |memo, item|
  memo + item
end