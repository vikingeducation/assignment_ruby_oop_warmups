require './my_each.rb'

class Array
  def my_select (proc_argument = nil)
    result = []
    self.my_each do |item|
      if block_given?
        result << item if yield(item)
      else
        result << item if proc_argument.call(item)
      end
    end
    result
  end
end