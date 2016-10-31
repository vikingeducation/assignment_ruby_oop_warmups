class Array 

	def my_map(&block) 
		i = 0
		arr = []
		while i < self.length
			arr.push(yield(self[i]))
			i += 1
		end
		arr
	end

end

array = [1,2,3]
array.my_map { |num| puts num*2 } 
puts array.inspect