class Array
	def my_map(proc = nil)
		result = []

			each do |item|
				if block_given?
					result << yield(item)
				else
					proc.call(item)
				end
			end
		result
	end
end

a = [1,2,5].my_map do |item|
   item ** 2
end

puts a