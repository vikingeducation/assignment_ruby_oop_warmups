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
end

my_proc = Proc.new { |item| puts item }

[1,2,5].my_each(my_proc)
[1,2,5].my_each{|item| puts item**2}
