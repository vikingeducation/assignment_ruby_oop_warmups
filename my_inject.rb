require_relative 'my_each.rb'

class Array

	def my_inject(int, my_proc=nil)
		self.my_each do |item|
			int = yield(int, item) if block_given?
			int = my_proc.call(int, item) if my_proc 
		end
		return int
	end

end