=begin
  - Create a method my_select (Done)
  - which extends the Array class (Done)
  - and has identical functionality to Ruby's native select method. (Done)
  - You can use your my_each method to implement this. (Done)
  - Make it take either a block or a proc. (Done)

  > my_proc = Proc.new{|item| item.even?}
  #=> #<Proc:0x007fbb6b9c1ff8@(irb):2>
  > [1,2,5].my_select(my_proc)
  #=> [2]
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

  def my_map
    new_array = []
    my_each{ |item| new_array << yield(item) }
    new_array
  end

  def my_select(my_proc)
    selected_items = []
    my_each do |item|
      selected_items << item if my_proc.call(item)
    end
    selected_items
  end

end

class Array
  include My_enumerator
end

my_proc = Proc.new{|item| item.even?}
print [1,2,5,8,10,11,14,18,22,24].my_select(my_proc)