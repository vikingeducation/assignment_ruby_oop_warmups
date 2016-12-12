class Array

	def my_each (my_proc = nil)
		if block_given?
			i = 0
			new_arr = []
    		while i < self.size
    			yield self[i]
    			i += 1
    		end
    		self
  		else
    		i = 0
    		while i < self.size
    			my_proc.call self[i]
    			i += 1
    		end
    		self
  		end
	end

	def my_map (my_proc = nil)
		if block_given?
			new_items = []
			i = 0
			self.my_each do	|item|
				new_items[i] = yield item
				i += 1
			end
			new_items
  		else
    		my_each my_proc
  		end
	end

	def my_select (my_proc = nil)
		if block_given?
			new_items = []
			self.my_each do	|item|
				if yield item
				 	new_items << item
				end
			end
			new_items
  		else
    		new_items = []
			self.my_each do	|item|
				if my_proc.call item
				 	new_items << item
				end
			end
			new_items
  		end
	end
	def my_all? (my_proc = nil)
		if block_given?
			all_true = true
			self.my_each do	|item|
				if yield item
					all_true
				else
					all_true = false
				end
			end
			all_true
  		else
  			all_true = true
			self.my_each do	|item|
				if my_proc.call item
					all_true
				else
					all_true = false
				end
			end
			all_true
  		end
	end
	def my_inject (initial, my_proc = nil)
		if block_given?
			result = initial
			self.my_each do	|item|
				result = yield result, item
			end
			p result
  		else
  			result = initial
			self.my_each do	|item|
				result = my_proc.call(result, item)
			end
			p result
  		end
	end
end

#p [1,2,5].my_each{ |item| puts item }

#my_proc = Proc.new{|item| puts item**3}

#[1,2,5].my_map(my_proc)

#[1,2,5].my_map do |item|
#	item ** 2
#end

#my_proc = Proc.new{|item| item.even?}
#p [1,2,5,12].my_select(my_proc)

#p [1,2,5,12].my_select {|item| item.even?}

#my_proc = Proc.new{|item| item.even?}
#p [10,2,12].my_all?(my_proc)

#[1,2,5].my_inject(0) do |memo, item|
#	memo + item
#end

my_proc = Proc.new{|memo, item| memo + item}

[1,2,5].my_inject(1, my_proc)
