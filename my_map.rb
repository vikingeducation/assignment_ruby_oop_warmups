class Array

  def my_map

    i = 0

    while i < self.length

      self[i] = yield self[i]

      i+=1

    end

    self

  end

end

print [1,2,5].my_map {|item| item ** 2}