require_relative 'my_each'

class Array
  def my_map(&block)
    new_arr = []
    self.my_each { |element| new_arr.push block.call(element) }
    return new_arr
  end
end
