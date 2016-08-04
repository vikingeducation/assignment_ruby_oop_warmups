class Array

  def my_each
    self.length.times do |x|
      yield(self[x])
    end
    self
  end

  def my_map
    result = []
    self.length.times do |x|
      result << yield(self[x])
    end
    result
  end

  def my_select
    result = []
    self.length.times do |x|
      result << self[x] if yield(self[x])
    end
    result
  end

  def my_all?
    self.my_each do |x|
      return false unless yield(x)
    end
    true
  end

  def my_inject(num)
    sum = 0
    self.my_each do |x|
      sum = yield(sum, x)
    end
    sum
  end

end