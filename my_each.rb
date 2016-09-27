class Array

 def my_each(proc_arg = self)
  if block_given?
    n = 0
    while n < self.length
      yield (self[n])
      n += 1
    end
  else
    proc_arg.call
  end
  self
 end
end

#ISSUE=======================
#returns nil at the end instead of the array


[1,2,5].my_each{ |item| puts item }
# 1
# 2
# 5
#=> [1,2,5]
my_proc = Proc.new{|item| puts item**2}
[1,2,5].my_each(&my_proc)
# 1
# 4
# 25
#=> [1,2,5]
