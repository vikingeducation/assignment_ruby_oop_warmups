class Array
	def my_each(proc=nil)
		length.times do |i|
			item = self[i]
			if block_given?
				yield(item)
			else
				proc.call(item)
			end
		end
		self
	end

	def my_map(proc=nil)
		mapped = []
		length.times do |i|
			item = self[i]
			if block_given?
				mapped << yield(item)
			else
				mapped << proc.call(item)
			end
		end
		mapped
	end

	def my_select(proc=nil)
		selected = []
		length.times do |i|
			item = self[i]
			if block_given?
				selected << item if yield(item)
			else
				selected << item if proc.call(item)
			end
		end
		selected
	end

	def my_all?(proc=nil)
		length.times do |i|
			item = self[i]
			if block_given?
				return false if ! yield(item)
			else
				return false if ! proc.call(item)
			end
		end
		return true
	end

	def my_inject(*args)
		value = nil
		proc = nil
		method = nil

		args.each do |arg|
			proc = arg if arg.class == Proc
			method = arg if arg.class == Symbol
			value = arg if ! [Symbol, Proc].include?(arg.class)
		end

		type = self[0].class
		if [Fixnum, Bignum, Integer].include?(type)
			initial_value = 0
		elsif type == Float
			initial_value = 0.0
		else
			initial_value = type.new
		end
		value = (value) ? value : initial_value

		length.times do |i|
			item = self[i]
			if proc
				value = proc.call(value, item)
			elsif method
				value = value.send(method, item)
			elsif block_given?
				value = yield(value, item)
			end
		end

		value
	end
end


