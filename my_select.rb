class Array
  def my_select
    i = 0
    selected = []
    while i < self.length
      if yield(self[i])
        selected.push(self[i])
      end
      i += 1
    end
    selected
  end
end
