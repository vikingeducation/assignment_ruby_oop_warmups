require_relative 'my_each'

class Array
  def my_inject(memo, proc = nil, &block)
    if memo.nil?
      memo = self[0]
    end
    if block_given?
      self.my_each do |x|
         memo = block.call(memo, x)
      end
    else
      self.my_each do |x|
         memo = block.call(memo, x)
      end
    end
    puts memo
  end
end

[1,2,5].my_inject(0) do |memo, item|
  memo + item
 end
