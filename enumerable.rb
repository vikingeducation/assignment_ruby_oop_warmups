require 'pry'

class Array
  def My_each
    # binding.pry
    self.length.times do |index|
      yield(self[index])
    end
    self
  end

  def My_map
    result = []
    self.length.times do |index|
      result << yield(self[index])
    end
    result
  end

  def My_select
    result = []
    self.length.times do |index|
      result << self[index] if yield(self[index])
    end
    result
  end

  def My_all?
    self.My_each do |element|
      return false unless yield(element)
    end
    true
  end

  def My_inject sum
    self.My_each do |element|
      sum = yield(sum, element)
    end
    sum
  end
end
