require './my_each.rb'

class Array
  def my_all? (proc_argument = nil)
    result = true
    if block_given?
      self.my_each do |item|
        result = false if !yield(item)
      end
    else
      self.my_each do |item|
        result = false if !proc_argument.call(item)
      end
    end
    result
  end
end