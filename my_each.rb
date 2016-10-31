class Array

  def my_each(&proc)

    counter = 0
    while counter < self.length
      yield(self[counter])
      counter += 1
    end

  end
end