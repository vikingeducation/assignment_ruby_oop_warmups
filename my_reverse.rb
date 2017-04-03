require 'pry'
def my_reverse(string)
	#initialize empty array
	reverse_array=[]
	#splits string into array
	string_array = string.split("")
	#iterates through array and puts x to the front of new array
	string_array.each do |x|

		reverse_array.unshift(x)
	end
	#put reverse array into string
	puts reverse_array.join
end
 