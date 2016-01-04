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
end

my_proc = Proc.new { |item| puts item }

#[1,2,5].my_each(my_proc)
#[1,2,5].my_each{|item| puts item**2}
print [1,2,5].my_map{|item| item**2}
print [1,2,5].my_map(my_proc)