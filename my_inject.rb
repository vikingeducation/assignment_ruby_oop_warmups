class Array
  def my_inject(*arg)
    if arg.empty?
      i = 0
      running_total = self[0]
      while i < self.length - 1
        running_total = yield(running_total, self[i+1])
        i += 1
      end
    else
      i = 1
      running_total = yield(arg[0], self[0])
      while i < self.length
        running_total = yield(running_total, self[i])
        i += 1
      end
    end
    running_total
  end
end
