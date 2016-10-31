class Array
  def my_inject(memo = 0, my_proc = nil)
    each do |element|
      if my_proc != nil
        memo = my_proc.call(memo, element)
      elsif block_given?
        memo = yield(memo, element)
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