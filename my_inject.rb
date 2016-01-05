class Array
  def my_inject(input, proc_argument=nil) # ask about input shown as 0
    i = 0
    inject_result = input
    until i == self.length
      if block_given?
        inject_result = yield(inject_result, self[i])
      else
        inject_result = proc_argument.call(inject_result, self[i])
      end
      i += 1
    end
    inject_result
  end
end

[1,2,5].my_inject(0) do |memo, item|
  memo + item
end