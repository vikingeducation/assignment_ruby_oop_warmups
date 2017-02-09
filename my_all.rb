require './my_each.rb'

class Array
  def my_all? (proc_argument = nil)
    result = true
    self.my_each do |item|
      if block_given?
        result = false if !yield(item)
      else
        result = false if !proc_argument.call(item)
      end
    end
    result
  end
end