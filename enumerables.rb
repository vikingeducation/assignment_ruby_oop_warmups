#My_each

#Create a method my_each which extends the Array class and has identical functionality to Ruby's native each method (obviously don't use each in the implementation). Make it take either a block or a proc.
require 'pry'


class Array


# the method is taking the block to perform that on each item


	def my_each

		# set the starting num to iterate
		num = 0

		# until the num reaches the array count - self.length
		until num == length do

			# call the block passing the value of the current num
			yield ( self[num] )

			# go to the next num
			num += 1

		end

		# return the array
		return self

	end


	def my_map

		# creates the array to MAP
		map_arr = []
		# push the result of calling my each into arr
		my_each { | num | map_arr << yield( num ) }

		return map_arr

	end


	# selecting items that match a certain condition
	def my_select

		select_array = []
		# call my each
    my_each do | num |
    	if yield( num )
    		select_array << num
    	else
    		next
    	end


    end

    return select_array

	end


#Create a method my_all? which extends the Array class and works the same as Ruby's native all? method. You can use your my_each method to implement this. Make it take either a block or a proc.

	def my_all?
		#if any element is false return false
		my_each do | element |
			if yield( element )
				next
			else
				return false
			end
		end

		# returns true when all iterations pass
		return true

	end


#Create a method my_inject which extends the Array class and works the same as Ruby's native inject method. You can use your my_each method to implement this. Make it take either a block or a proc.

 def my_inject( num )

 	#method with iterate with my_each
 	#there needs to be a total and element - total tracked with variable, that can be passed into the method
 	result = num

 	my_each do | element |

 		# total will equal the number sent to my each
 		# pass the total
 		result = yield( result, element )

 	end

 	return result



 end

end



print [2,10,20,43].my_each { | e | e + 2 }


print [2,10,20,43].my_map { | e | e * 2 }


[2,10,20,43].my_select { | e | e % 2 == 0 }

["me", "my", "ouch", "hello"].my_all? { | w | w.length >= 4}

[2,4,2,5].my_inject(0) { | result, element | result + element }


