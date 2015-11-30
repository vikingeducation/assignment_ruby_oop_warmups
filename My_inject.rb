=begin
  - Create a method my_inject (Done)
  - which extends the Array class (Done)
  - and works the same as Ruby's native inject method. (Done)
  - You can use your my_each method to implement this. (Done)
  - Make it take either a block or a proc. (Done)

> [1,2,5].my_inject(0) do |memo, item|
>   memo + item
> end
#=> 8
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

  def my_inject(beginning_number)
    total = beginning_number
    my_each do |number|
      total += yield(0, number)
    end
    total
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

puts [1,2,4].my_inject(30) { |memo, item| memo + item * 2 }
#=> 8