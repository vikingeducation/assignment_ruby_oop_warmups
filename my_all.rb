require_relative 'my_each.rb'

class Array

  def my_all?(my_proc)
    all_array = []
    self.my_each do |item|
      if my_proc.call(item)
        all_array << item
      end
    end
    return true if all_array.length == self.length
    return false

  end

end