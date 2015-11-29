=begin

- Create a method my_map (Done)
- which extends the Array class (Done)
- and has identical functionality to Ruby's native map method. (Done)
- You can use your my_each method to implement this. (Done)
- Make it take either a block or a proc. (Done)

e.g.
> [1,2,5].my_map do |item|
>   item ** 2
> end
#=> [1,4,25]

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

end

class Array
  include My_enumerator
end

print [1,2,5].my_map{|item| item ** 2}