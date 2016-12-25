class Array
  def my_each(proc_argument = nil)
    i = 0
    while i < self.size
      if block_given?
        yield(self[i]) 
      else
        proc_argument.call(self[i])
      end
      i += 1
    end
    self
  end
  
  def my_map(proc_argument = nil)
    mapped_array = [] 
    self.my_each do |e|
      if block_given?
        mapped_array << yield(e)
      else 
        mapped_array << proc_argument.call(e)
      end
    end
    mapped_array
  end

  def my_select(proc_argument = nil)
    selection = []
    self.my_each do |e|
      if block_given?
        selection << e if yield(e)
      else
        selection << e if proc_argument.call(e)
      end
    end
    selection
  end

  def my_all?(proc_argument = nil)
    self.my_each do |e|
      if block_given?
        return false unless yield(e)
      else
        return false unless proc_argument.call(e)
      end
    end
    true
  end

  def my_inject(memo = nil, proc_argument = nil)
    memo ||= self[0]
    self.my_each do |e|
      if block_given?
        memo = yield(memo, e)
      else
        memo = proc_argument.call(memo, e)
      end
    end
    memo
  end
end

# my_each
p [1,2,5].my_each{ |item| puts item }
my_proc = Proc.new{|item| puts item**2}
p [1,2,5].my_each(my_proc)

# my_map
p [1,2,5].my_map { |item| item ** 2 }

# my_select
my_proc = Proc.new{|item| item.even?}
p [1,2,5].my_select(my_proc)

# my_all
my_proc = Proc.new{|item| item.even?}
p [1,2,5].my_all?(my_proc)

# my_inject
p [1,2,5].my_inject(0) { |memo, item| memo + item }
