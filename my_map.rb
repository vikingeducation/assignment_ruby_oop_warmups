require_relative "my_each"

class Array

  def my_map(proc=nil)
    result = []
    if block_given?
      self.my_each do |item|
        result << (yield item)
      end
    else
      self.my_each do |item|
        result << (proc.call(item))
      end
    end
    result
  end
end
