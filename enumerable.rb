class Array

	def my_each proc_arg = nil
		i = 0
		while i < self.length
			if block_given?
				yield self[i] 
			else
				proc_arg.call self[i]
			end
			i += 1
		end
		self
	end

	def my_map proc_arg = nil
		result = []
		if block_given?
			self.my_each { |i| result << yield(i) }
		else
			self.my_each { |i| result << proc_arg.call(i) }
		end
		result
	end

	def my_select proc_arg = nil
		result = []
		if block_given?
			self.my_each { |i| result << i if yield(i) }
		else
			self.my_each { |i| result << i if proc_arg.call(i) }
		end
		result
	end

	def my_all? proc_arg = nil
		if block_given?
			self.my_each { |i| return false unless yield(i) }
		else
			self.my_each { |i| return false unless proc_arg.call(i) }
		end
		true
	end

	def my_inject total = 0, proc_arg = nil
		total = total
		if block_given?
			self.my_each { |i| total = yield([total, i]) }
		else
			self.my_each { |i| total = proc_arg.call([total, i]) }
		end
		total
	end
end




arr = [1,2,3,4,5]

puts arr.my_all? { |i| i < 4 }

proc_double = Proc.new{ |i| i < 4 }
puts arr.my_all? proc_double

arr = [1,2,3,4,5]

puts arr.my_inject(5) { |result, i| result + i }

proc_add = Proc.new { |result, i| result + i }

puts arr.my_inject(0, proc_add)