require_relative 'my_each'

class Array
  def my_inject(number, &block)
    total = number
    self.each { |element| total = block.call(total, element) }
    return total
  end
end
