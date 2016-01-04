class Array
  def my_all? (proc_argument = nil)
    result = true
    i = 0
    until i == self.length
      if block_given?
        result = false unless yield(self[i])
      else
        result = false unless proc_argument.call(self[i])
      end
      i+=1
    end
    result
  end
end

my_proc = Proc.new{|item| item.even?}

[1,2,5].my_all?(my_proc)

[2,4,6].my_all?(my_proc)
