require_relative 'my_each'

class Array
  def my_select(&block)
    new_arr = []
    self.my_each { |element| new_arr << element if block.call(element) }
    return new_arr
  end
end
