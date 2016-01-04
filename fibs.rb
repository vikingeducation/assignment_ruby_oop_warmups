def fibs(number)
  fibonacci_array = Array.new
  if number == 0
    fibonacci_array=[0]
  elsif number == 1
    fibonacci_array[1]
  else
    new_element = fibs(number-1) + fibs(number-2)
    fibonacci_array += new_element
  end
  fibonacci_array
end

print fibs(1)
print fibs(2)
print fibs(3)

# Think about splitting the recursive into its own method

def fibs(number)
fibonacci_array = [0,1]
  
    def generate_next(array, number) 
      next_element = array[number-1]+array[number-2]
      return next_element
    end

    (length-2).times do |element|
      fibonacci_array << next_element(fibonacci_array)
    end

end