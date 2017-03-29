require_relative 'my_each'

class Array
  def my_all?(&block)
    self.my_each { |element| return false if !block.call(element) }
    return true
  end
end
