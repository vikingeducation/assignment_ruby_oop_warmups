class Array

  def my_each(&proc)

    counter = 0
    while counter < self.length
      block_given? ? yield(self[counter]) : proc.call(self[counter])
      counter += 1
    end

  end
end