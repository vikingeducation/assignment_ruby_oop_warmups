# Create a method my_inject which extends the Array class and works the same as Ruby's
# native inject method. You can use your my_each method to implement this. Make it take
# either a block or a proc.

class Array
  def my_inject(initial = nil, proc = nil)
    if initial.nil?
      initial = self.any? ? self[0] : 0
    end
    memo = initial
    for i in (0..self.length - 1)
      if block_given?
        memo = yield(memo, self[i])
      elsif not proc.nil?
        memo = proc.call(memo, self[i])
      end
    end
    return memo
  end
end



puts ([1, 2, 5].my_inject(0) do |memo, item| 
  memo + item
end)
#=> 8