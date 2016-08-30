class Array
	def my_each(proc = nil)
		if block_given?
			for i in 0..self.size-1 do
        		yield(self[i])   
      		end
		else	
			for i in 0..self.size-1 do
        		proc.call(self[i])   
      		end
		end
		
	
	end
	
	def my_map(proc=nil)
		arr = []
		if block_given?
			for i in 0..self.size-1 do
        		arr << yield(self[i])   
      		end
		else
			for i in 0..self.size-1 do
        		arr << proc.call(self[i])   
      		end
		end
		
      	arr
	end
        
    def my_select(proc = nil)
		arr = []
		if block_given?
			for i in 0..self.size-1 do
				yield(self[i]) ? arr << self[i] : next
			end
			
			
		else
			for i in 0..self.size-1 do
				proc.call(self[i]) ? arr << self[i] : next
			end
		
		end
		arr
	end
        
    def my_all?(proc = nil)
		if block_given?
			for i in 0..self.size-1 do
				return false unless yield(self[i])
			end
		else
			for i in 0..self.size-1 do
				return false unless proc.call(self[i])
			end
		end
		true
		
	end
        
    def my_inject(start, proc = nil)
		 total=start
    	for i in 0..self.size-1 do
    		total += self[i]
    	end
    total
	end
end