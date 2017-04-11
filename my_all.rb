class Array

  def my_all?(out_thing=true, &block)
    if self.length > 0
      if yield(self[0]) == false
        false
      else
        self[1..-1].my_all?(out_thing, &block)
      end
    else
      out_thing
    end
  end

end

b = (1..100).to_a.my_all? { |x| x.even? }

print(b)

puts()


c = (1..100).to_a.my_all? { |x| x > 0 }

print(c)

puts()
