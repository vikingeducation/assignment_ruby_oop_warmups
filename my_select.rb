class Array 

  def my_select(&block) 
    i = 0
    arr = []
    while i < self.length
      if yield(self[i])  
        arr.push(self[i])
      end
      i += 1
    end
    arr
  end

end

array = [1,2,3,5,6,4,8,9]
puts array.my_select { |num| num % 2 == 0} 
