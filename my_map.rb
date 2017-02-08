require './my_each.rb'

class Array
  def my_map (proc_argument = nil)
    result = []
    if block_given?
      self.my_each do |item|
        result << yield(item)
      end
    else
      self.my_each do |item|
        result << proc_argument.call(item)
      end
    end
    result
  end
end