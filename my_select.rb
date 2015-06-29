class Array

  def my_select

    i = 0

    while i < self.length

      puts yield (self[i])

      i+=1

    end

  end

end

print [1,2,5].my_select {|item| item.even?}