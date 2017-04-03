class Array
	def my_each
		i = 0
		while i < self.length
			yield(self[i])
			i += 1
	  end
	  self
  end
end

arr = [1,3,5]

arr.my_each do |n|
	puts n

  def my_map(&block)
  	arr = []
  	i = 0
  	while i < self.length
  		arr << yield(self[i])
  		i += 1
  	end
  	arr
  end

  def my_select(&block)
  	arr = []
  	i = 0
  	while i < self.length
  		if yield(self[i])
  			arr << self[i]
  		end
  		i += 1
  	end
  end
  

end