class Array
def my_each(&block)
	new_array = []
	
	new_array.push(yield block.call)
end


array = [1,3,4]

array.my_each do |x|
	puts x
	end
	puts array.length

end