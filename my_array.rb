class Array



  def my_each 

    i = 0

    while i < self.length

      yield (self[i])

      i+=1

    end

    self

  end



  def my_map

    i = 0

    new_array = []

    while i < self.length

      new_array << (yield self[i])

      i+=1

    end

    new_array

  end



  def my_select

    new_array = []

    self.my_each do |x|

      if yield x

        new_array << x

      end

    end

    new_array

  end



end

puts [1, 5, 6, 8, 16, 4, 22, 33].my_select {|item| item.even?}

