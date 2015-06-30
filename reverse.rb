def string_reverse (str)

  array = str.split("")
  new_array = []
  
  first_letter = 0
  last_letter = array.length-1

  (last_letter).downto(first_letter).each do |x|
    new_array << array[x]
  end

  return new_array.join

end

puts string_reverse ("hello")