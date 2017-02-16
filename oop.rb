# Build method that reverses a string without using built-in reverse method
def my_reverse(string)
	i = string.length - 1
	str_reverse = ""
	while i >= 0
		str_reverse << string[i]
		i -= 1
	end
	str_reverse
end

# Create fibonacci sequence in array with specific number of elements starting with 0 and 1 
def fibs(num)
	fib_arr = [0,1]
	if num < 0 || num == 0
		return []
	elsif num == 1
		fib_arr.pop
	elsif num > 1
		(num-2).times do
			fib_arr << fib_arr[-1] + fib_arr[-2]
		end
	end
	fib_arr
end

# Create benchmark method that takes parameter "number of times" and a block, and returns 
# how long it took to run that block that many times
def benchmark(number_of_times) 
	start_time = Time.now.to_f
	number_of_times.times do
		yield if block_given?
	end
	finish_time = Time.now.to_f
	finish_time - start_time
end

# Rebuid Enumerable Methods!

# My_each
class Array
	def my_each(proc_arg = nil)
		i = 0
		while i < self.length
			if block_given?
				yield(self[i])
				i += 1
			else
				proc_arg.call(self[i])
				i += 1
			end
		end
	end
end

# My_map
class Array
	def my_map(proc_arg = nil)
		arr = []
		for i in self 
			if block_given?
				arr << yield(i)
			else
				 arr << proc_arg.call(i)
			end
		end
		arr
	end
end

# My_select
class Array
	def my_select(proc_arg = nil)
		arr = []
		self.length.times do |i|
			if block_given?
				if yield(self[i])
					arr << self[i]
				end
			else
				if proc_arg.call(self[i])
					arr << self[i]
				end
			end
		end
		arr
	end
end

# My_all?
class Array
	def my_all?(proc_arg = nil)
		i = 0
		while i < self.length
			if block_given?
				if !yield(self[i])
					return false
				end
			else
				if !proc_arg.call(self[i])
					return false
				end
			end
			i += 1
		end
		return true
	end
end

# My_inject
class Array
	def my_inject(num, proc_arg = nil)
		result = num
		i = 0
		while i < self.length
			if block_given?
				result = yield(result, self[i])
				i += 1
			else
				result = proc_arg.call(result, self[i])
				i += 1
			end
		end
		result
	end
end











