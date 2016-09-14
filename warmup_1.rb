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

# ---------------------------------------
# Fibonacci
# fibs(number)
# number = number of elements of fibonacci sequence
# fibs(5)
# GOAL [0, 1, 1, 2, 3]

def fibs(number)
  sequence = [0, 1]
  number -= 2
  number.times do
    sum = sequence[-1] + sequence[-2]
    sequence << sum
  end
  sequence
end

p fibs(5)
