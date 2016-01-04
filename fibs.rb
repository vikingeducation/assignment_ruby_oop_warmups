
=begin
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
=end




# Think about splitting the recursive into its own method

def generate_next(number)
  if number == 0
    return 0
  elsif number == 1
    return 1
  else
    next_element = generate_next(number-1) + generate_next(number-2)
  end
  return next_element
end

def fibs(number)
  fibonacci_array = []
  number.times do |number|
    fibonacci_array << generate_next(number)
  end
  fibonacci_array
end

print fibs(1)
print fibs(2)
print fibs(3)
print fibs(4)
print fibs(5)