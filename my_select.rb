class Array

  def my_select(my_proc)
    counter = 0
    select_array = []
    while counter < self.length
      if my_proc.call(self[counter])
        select_array << self[counter]
      end
      counter += 1
    end
    return select_array
  end

end