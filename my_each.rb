=begin
  - Create a method my_each (Done)
  - which extends the Array class (Done)
  - and has identical functionality to Ruby's native each method
  - (obviously don't use each in the implementation).
  - Make it take either a block or a proc.
=end

module My_enumerator
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end
end

class Array
  extend My_enumerator
end

print [1,2,5].my_each{ |item| puts item }