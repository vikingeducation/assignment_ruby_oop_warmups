class Array

  def my_select(out_things=[], &block)
    if self.length > 0
      if yield(self[0]) == true
        out_things.push(self[0])
      end
      self[1..-1].my_select(out_things, &block)
    else
      out_things
    end
  end

end

b = (1..100).to_a.my_select { |x| x.even? }

print(b)

puts()
