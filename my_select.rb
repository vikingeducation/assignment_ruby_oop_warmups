class Array
  def my_select(proc_argument=nil)
    results = []
    i = 0
    until i == self.length
      if block_given?
        results << self[i] if yield(self)
      else
        results << self[i] if proc_argument.call(self[i])
      end
      i += 1
    end
    results
  end
end

my_proc = Proc.new{|item| item.even?}
[1,2,5].my_select(my_proc)