class Array
    def my_each(theproc = nil)

	  	counter = 0

	  	if block_given?
			while counter < self.count
		      yield(self[counter])
		      counter += 1
		    end
		else
		    while counter < self.count
		      theproc.call(self[counter])
		      counter += 1
		    end
		end

		return self
	end

	def my_map(theproc = nil)

		result_array = []

		if block_given?
			self.my_each do |num|
				result_array << yield(num)
			end
		else
			self.my_each do |num|
				result_array << theproc.call(num)
			end
		end

		return result_array
	end

	def my_select(theproc = nil)

		result_array = []

		if block_given?
			self.my_each do |num|
				result_array << num if yield(num)
			end
		else
			self.my_each do |num|
				result_array << num if theproc.call(num)
			end
		end

		return result_array
	end

	def my_all?(theproc = nil)

		if block_given?
			self.my_each do |num|
				return false unless yield(num)
			end
		else
			self.my_each do |num|
				return false unless theproc.call(num)
			end
		end

		return true
	end

	def my_inject(theproc = nil, init = nil)
		init ? total = init : total = 0
		if block_given?
			self.my_each do |num|
				total = yield(total, num)
			end
		else
			self.my_each do |num|
        total = theproc.call(total, num)
			end
		end
    total
	end

end

#my_proc = Proc.new { |item| item.even? }

#[1,2,5].my_each(my_proc)
#[1,2,5].my_each{|item| puts item**2}
# print [1,2,5].my_map{|item| item**2}
# print [1,2,5].my_map(my_proc)
# puts [1,2,5].my_select(my_proc).inspect
# puts [8,2,6,12].my_all?{ |item| item.even? }.inspect
#my_proc = Proc.new { |memo, item| memo + item }
#puts [1,2,5].my_inject(my_proc)
#puts [1,2,5].my_inject(my_proc, 0)
#puts [1,2,5].my_inject(0) { |memo, item| memo + item }
#puts [1,2,5].my_inject(0, my_proc)
#puts [1,2,5].inject(0, my_proc)