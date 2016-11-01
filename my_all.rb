class Array 

  def my_all?(&block) 
    i = 0
    arr = []
    while i < self.length
      return false unless yield(self[i])
      i += 1
    end
    true
  end

end

array = [2,4,6,8]
puts array.my_all? { |num| num % 2 == 0} 
