# my_reverse(string)
# take string & split the characters
# take last character and move it from the end of array to beginning of new array
# once all the characters have been moved, join the array
# s t r i n g
# GOAL 'g n i r t s'
# g
# g n
# g n i
# g n i r
# g n i r t
# g n i r t s
def my_reverse(string)
  reversed_array = []
  split_string = string.split('')
  string.length.times do
    reversed_array << split_string.pop
  end
  reversed_array.join
end


puts my_reverse("Timothy")
puts my_reverse("Scott")
