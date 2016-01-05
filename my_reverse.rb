#Reverse String
def my_reverse(str)

    print "Original String #{str}, "
	((str.length)/2).times do |ind|
		str[ind],str[str.length - ind - 1] =  str[str.length - ind - 1],str[ind]
	end
	puts "Reversed String #{str}"
	str
end

my_reverse("BLAH")
my_reverse("QUICK")
my_reverse("ELEPHANT")