#My_each

#Create a method my_each which extends the Array class and has identical functionality to Ruby's native each method (obviously don't use each in the implementation). Make it take either a block or a proc.
require 'pry'


class Array


# the method is taking the block to perform that on each item


	def my_each

		# set the starting index to iterate
		index = 0

		# until the index reaches the array count
		until index > (self.count - 1) do

			# call the block passing the value of the current index
			yield self[index]

			# go to the next index
			index += 1

		end

	end


end



[2,10,20,30].my_each { | e | puts e / 2 }









=begin
	def my_each( proc )

		#take the array starting with the first element
		index = 0
		until index > (self.count - 1) do
			yield self[index]
			index += 1
		end

	end


end

proc = Proc.new { | e | puts e + 2 }

[1,6,2,7].my_each( proc )
=end