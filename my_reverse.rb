#ruby_methods.rb


##  MY REVERSE ##

# reverse a string
def my_reverse( string )

	# create new array to store the reversed characters
	reversed_array = []

	# store the parameter in a var after splitting into characters
	split_array = 	string.chars

	( split_array.count ).times do
		reversed_array << split_array.pop
	end

print reversed_array.join

end

puts "Enter a word"
string = gets.strip
my_reverse( string )




