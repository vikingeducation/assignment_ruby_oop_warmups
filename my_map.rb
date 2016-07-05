class Array
	def my_map
		map_array = []
		counter = 0
		while counter < self.length
			map_array << yield(self[counter])
			counter += 1
		end
		return map_array
	end
end