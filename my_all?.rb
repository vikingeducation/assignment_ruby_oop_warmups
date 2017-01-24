require_relative "my_each"

class Array

  def my_all?(proc=nil)
    if block_given?
      self.my_each do |item|
        if !(yield(item))
          return false
        end
      end
      return true
    else
      self.my_each do |item|
        if  !(proc.call(item))
          return false
        end
      end
      return true
    end
  end
end
