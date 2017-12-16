
def reverse(string)
  if string != string.to_s
   puts "Please enter only a word or words to reverse, #{string} is not valid."
  else
  array2 = []
  array = string.split(//)
  array.each do |flip|
    array2.unshift(array[array.index(flip)])
  end
  puts "The reverse of #{string} is #{array2.join}."
  end
end

reverse("fish")
reverse(5.0)
reverse("french horn")
