class Array

  def my_each 

    i = 0

    while i < self.length

      puts yield (self[i])

      i+=1

    end

  end

end

puts [1, 2, 3].my_each {|item| item**2}

