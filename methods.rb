

class Array
	def my_each(input = nil)
		i = 0
		while i < self.size
			if block_given?
				yield(self[i])
			else
				input.call(self[i])
			end
			i += 1
		end
		
		return self
	end
	
	def my_map(input = nil)
		result = []
		
		i = 0
		while i < self.size
			if block_given?
				result.push(yield(self[i]))
			else
				result.push(input.call(self[i]))
			end
			i += 1
		end
		
		return result
	end
	
	
	def my_select(input = nil)
		result = []
		
		i = 0
		while i < self.size
			if block_given?
				if yield(self[i])
					result.push(self[i])
				end
			else
				if input.call(self[i])
					result.push(self[i])
				end
			end
			i += 1
		end
		
		return result
	end
	
	
	def my_all?(input = nil)
		result = true
		
		i = 0
		while i < self.size
			if block_given?
				if not yield(self[i])
					result = false
				end
			else
				if not input.call(self[i])
					result = false
				end
			end
			i += 1
		end
		
		return result
	end
	
	def my_inject(init, input = nil)
		result = init
		
		i = 0
		while i < self.size
			if block_given?
				#result = yield(result, self[i])
				(&input)
				puts "blk"
			else
				result = input.call(result, self[i])
				puts "proc"
			end
			i += 1
		end
		
		return result
	end
end





def my_reverse(str)
	str.chars.reverse.join
end

def fibs(n)
	if n <= 0 
		nil
	elsif n == 1
		[1]
	elsif n == 2
		[0,1]
	else
		arr = [1] * n
		arr[0] = 0
		
		(3..n).each { |i| 
			arr[i - 1] = arr[i - 2] + arr[i - 3]
		}
	
		arr
	end
		
end


def my_benchmark(time)
	start = Time.now
	time.times {
		yield
	}

	Time.now - start
end