class Array
  def my_map
      i = 0
      new_arr = []
      while i < self.size 
          new_arr[i] = yield(self[i])
          i += 1
      end
      new_arr
  end

  def my_select
      i = 0
      n = 0
      new_arr = []
      while i < self.size 
          if yield(self[i])
          	 new_arr[n] = self[i]
             n += 1
          end  	 
          i += 1
      end
      return new_arr
  end
end

arr = [1,2,3,4,5,20,40]
x = arr.my_map {|item| item * 3} 
puts x.inspect           

arr = [1,2,3,4,5,20,40]
x = arr.my_select {|item| item < 10} 
puts x.inspect   