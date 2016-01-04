class Array
  def my_map(proc_argument=nil)
    i = 0
    results = []

    until i == self.length
      if block_given?
        results << yield(self[i])
      else
        results << proc_argument.call(self[i])
      end
      i += 1
    end
    results
  end
end

[1,2,5].my_map do |item|
  item ** 2
end