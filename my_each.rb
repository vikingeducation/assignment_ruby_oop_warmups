=begin
  - Create a method my_each (Done)
  - which extends the Array class (Done)
  - and has identical functionality to Ruby's native each method (Done)
  - (obviously don't use each in the implementation). (Done)
  - Make it take either a block or a proc. (Done)
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
  include My_enumerator
end

new_array = []
[1,2,5].my_each{ |item| new_array << item ** 2 }
print new_array