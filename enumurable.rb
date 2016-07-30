module EnumModule

  def my_each
    if block_given?
      self.length.times do |i|
        yield(self[i])
      end
      self
    end
  end

  def my_map
    arr = []
    if block_given?
      self.length.times do |i|
        arr << yield(self[i])
      end
    end
    arr
  end

  def my_select
    arr = []
    if block_given?
      self.length.times do |i|
        arr << yield(self[i])
      end
    end
    arr
  end

  def my_all?
    if block_given?
      self.length.times do |i|
        return false if !(yield(self[i]))
      end
      true
    end
  end

  def my_inject
    if block_given?
      self.length.times do |i|
        yield(self[i])
      end
      self
    end
  end

  def my_inject init=0
    self.my_each do |element|
      init = yield(init, element)
    end
    init
  end

end

class Array
  include EnumModule
end
