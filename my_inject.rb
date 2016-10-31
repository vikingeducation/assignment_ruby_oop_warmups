class Array 

  def my_inject(start=nil, &block) 
    start = self[0] if start.nil? 
    i = 0
    total = start
    while i < self.length
      total = yield(total, self[i]) 
      i += 1
    end
    total
  end

end

array = [1,2,3]

puts array.my_inject(0) { |memo, item| memo + item }
