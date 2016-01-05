class Array
	
  def my_each(theproc = nil)

  	pos = 0

		while pos < self.count
			if block_given?
				yield(self[pos])
			else
				theproc.call(self[pos])
			end
			pos +=1
		end
		return self
	end

	def my_map(theproc = nil)

		result_array = []

		self.my_each do |num|
			block_given? ? result_array << yield(num) : result_array << theproc.call(num)
		end

		return result_array
	end

	def my_select(theproc = nil)

		result_array = []

		self.my_each do |num|
			if block_given?
				result_array << num if yield(num)
			else
				result_array << num if theproc.call(num)
			end
		end

		return result_array
	end

	def my_all?(theproc = nil)

		self.my_each do |num|
			if block_given?
				return false unless yield(num)
			else
				return false unless theproc.call(num)
			end
		end

		return true
	end

	def my_inject(theproc = nil)
		total = 0

		self.my_each do |num|
			block_given? ? total = yield(total, num) : total = theproc.call(total, num)
		end

		return total
	end
end

my_proc = Proc.new { |item| item.even? }

# puts [1,2,5].my_each(my_proc).inspect
#[1,2,5].my_each{|item| puts item**2}
# puts [1,2,5].my_map{|item| item**2}.inspect
# puts [1,2,5].my_map(my_proc).inspect
puts [1,2,5].my_select(my_proc).inspect
puts [1,2,5].my_select{ |item| item.even? }.inspect
puts [8,2,6,12].my_all?{ |item| item.even? }.inspect
puts [1,2,5].my_inject(0) { |memo, item| memo + item }