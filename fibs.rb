def fibs(no_of_terms)
    
    return no_of_terms if no_of_terms <= 1

    first = 0
    second = 1 
    
    arr = Array.new
    arr << first
    arr << second

    (no_of_terms - 2).times do  
       next_term = first + second
       arr << next_term
       first = second
       second = next_term
	end
	arr.inspect
end	

puts fibs(8)
puts fibs(10)		