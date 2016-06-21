class Array
	def my_each
		number_index = 0
		while number_index < self.length do
			yield self[number_index]
			number_index += 1
		end
		self
	end

	def my_map
		number_index = 0
		mapped_array = []
		while number_index < self.length do
			mapped_array << yield(self[number_index])
			number_index += 1
		end
		mapped_array
	end

	def my_select
		mapped_array = []
		while number_index < self.length do
			if yield(self[number_index])
				mapped_array << self[number_index]
			end
			number_index += 1
		end
		mapped_array
	end

	def my_all?
		number_index = 0
		while number_index < self.length do
			if !yield(self[number_index])
				return false
			end
			number_index += 1
		end
		return true
	end

	def my_inject value=0
		adder = value
		my_each do |item|
			adder = yield(adder, item)
		end
		adder
	end
end

