class Array

  def my_each 

    i = 0

    while i < self.length

      yield (self[i])

      i+=1

    end

  end

  def my_map

    i = 0

    while i < self.length

      self[i] = yield self[i]

      i+=1

    end

    self

  end

  def my_select

    self.my_each do

      yield 

    end

  end

end

puts [1, 2, 3].my_select {|item| item.even?}

