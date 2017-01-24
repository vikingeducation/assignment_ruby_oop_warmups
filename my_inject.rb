require_relative "my_each"

class Array

  def my_inject(initial=nil, proc = nil)

    if !initial
      result = self[0]
    else
      result = initial
    end

    if block_given?
      self.my_each_with_index do |element, index|
        result = yield result, element
      end
    else
      self.my_each_with_index do |element, index|
        result =  (proc.call(result, element))
      end
    end
    result
  end
end
