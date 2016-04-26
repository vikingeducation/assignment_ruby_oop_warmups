class Array
  def my_all?
    i = 0
    while i < self.length
      if !yield(self[i])
        return false
      end
      i += 1
    end
    return true
  end
end
