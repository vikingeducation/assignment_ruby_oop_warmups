class Array

  def my_inject(out_thing=0, &block)
    if self.length > 0
      out_thing = yield(out_thing, self[0])
      self[1..-1].my_inject(out_thing, &block)
    else
      out_thing
    end
  end

end

b = (1..100).to_a.my_inject(out_thing=0) { |x , y| x + y }

print(b)

puts()


c = (1..100).to_a.my_inject(out_thing=1) { |x, y | x - y }

print(c)

puts()
