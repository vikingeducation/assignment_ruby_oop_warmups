class Array

	def my_each(&block)

		length = self.length

		i = 0

		while i < self.length
			block.call(self[i])
			i += 1

		end

	end



	def my_map(&block)

		return_array = []

		self.my_each do |element|
			return_array << block.call(element)
		end
		return return_array
	end


	def my_select(&block)

		return_array = []

		self.my_each do |element|
			return_array << element if block.call(element)
		end
		return return_array
	end

	def my_all?(&block)

		self.my_each do |element|

			return false if block.call(element) == false

		end

		true

	end

	def my_inject(value, &block)

		return_value = value

		self.my_each do |element|

			return_value = block.call(return_value, element)

		end

		return_value

	end

end



#arry = ["foo", "bar"]

=begin
reduced = arry.my_inject("") do |memo, item|

	memo + item

end
=end

#p reduced

#p arry.my_all? { |num| num.class == Fixnum }

#p arry.my_select{|num| num.even?}

# p arry.my_map{|num| num*num}

# arry.my_each{|element| puts element}

