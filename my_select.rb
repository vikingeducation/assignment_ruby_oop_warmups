require './my_each.rb'

class Array
  def my_select (proc_argument = nil)
    result = []
    if block_given?
      self.my_each do |item|
        result << item if yield(item)
      end
    else
      self.my_each do |item|
        result << item if proc_argument.call(item)
      end
    end
    result
  end
end