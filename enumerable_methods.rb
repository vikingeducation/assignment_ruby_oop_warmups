# Create a method my_each which extends the Array class and
# has identical functionality to Ruby's native each method
# (obviously don't use each in the implementation). Make it
# take either a block or a proc.

class Array
  def my_each(proc_argument = nil)
    i = 0
    while i < self.length
      block_given? ? yield(self[i]) : proc_argument.call(self[i])
      i += 1
    end
  end
end

# accepts a block
[1,2,5].my_each{ |item| puts item }

# accepts a proc
putser_proc = Proc.new { |item| puts item }
[1,2,5].my_each(&putser_proc)
