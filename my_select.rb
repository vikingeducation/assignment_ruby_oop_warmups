require_relative "my_each"

class Array

  def my_select(proc=nil)
    result = []
    if block_given?
      self.my_each do |item|
        result << item if yield(item)
      end
    else
      self.my_each do |item|
        result << item if proc.call(item)
      end
    end
    result
  end
end
