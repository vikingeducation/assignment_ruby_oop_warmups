class Array
  def my_map
    i = 0
    mapped = []
    while i < self.length
      mapped.push(yield(self[i]))
      i += 1
    end
    mapped
  end
end
