require './my_each.rb'

class Array
  def my_inject (initial, proc_argument = nil)
    running_total = initial
    if block_given?
      self.my_each do |item|
        running_total = yield(running_total, item)
      end
    else
      self.my_each do |item|
        running_total = proc_argument.call(running_total, item)
      end
    end
    running_total
  end
end