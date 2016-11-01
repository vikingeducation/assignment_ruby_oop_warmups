class Array 

	def my_each(&block) 
		i = 0
		arr = []
		while i < self.length
			arr.push(yield(self[i]))
			i += 1
		end
		self
	end

end

array = [1,2,3]
array.my_each { |num| puts num*2 } 
puts array.inspect