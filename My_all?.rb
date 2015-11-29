=begin
  - Create a method my_all? (Done)
  - which extends the Array class (Done)
  - and works the same as Ruby's native all? method. (Done)
  - You can use your my_each method to implement this. (Done - but I used the my_select method which uses the my_each method)
  - Make it take either a block or a proc. (Done)

> my_proc = Proc.new{|item| item.even?} (Done)
#=> #<Proc:0x007fbb6b9c1ff8@(irb):2>
> [1,2,5].my_all?(my_proc)
#=> false

=end

module My_enumerator

  def my_all?(my_proc)
    return true if my_select(my_proc).size == self.size
    return false
  end

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
puts [2,2,8].my_all?(my_proc)