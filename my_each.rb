class Array
	def my_each
		counter = 0
		while counter < self.length
			yield(self[counter])
			counter += 1
		end
		return self
	end
end