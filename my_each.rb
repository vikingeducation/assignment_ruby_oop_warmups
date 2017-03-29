class Array
  def my_each
    self.length.times { |element| yield self[element] }
  end
end
