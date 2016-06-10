#ruby_methods.rb



def my_reverse( string )

	reversed_array = []

	n = -1

	(string.length).times do
		reversed_array << string[n]
		n -= 1
	end

print reversed_array.join
return reversed_array.join


end

puts "Enter a word"

string = gets.strip

my_reverse( string )




