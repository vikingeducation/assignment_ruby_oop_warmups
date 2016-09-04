def my_reverse(string)
  result = ""
  (1..string.length).each do |i|
     result << string[-i]
  end
  result
end

puts my_reverse "I'm a string"