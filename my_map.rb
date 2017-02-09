require './my_each.rb'

class Array
  def my_map (proc_argument = nil)
    result = []
    self.my_each do |item|
      if block_given?
        result << yield(item)
      else
        result << proc_argument.call(item)
      end
    end
    result
  end
end