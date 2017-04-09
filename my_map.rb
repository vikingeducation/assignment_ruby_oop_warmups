class Array

  def my_map(out_things=[], &block)
    if self.length > 0
      self[1..-1].my_map(out_things.push(yield(self[0])) , &block)
    else
      out_things
    end
  end

end

b = [1,2,3].my_map { |x| x + 1 }

print(b)

puts()
