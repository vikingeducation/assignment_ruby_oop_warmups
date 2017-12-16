
def reverse(string)
  if string != string.to_s
   puts "Please enter only a word or words to reverse, #{string} is not valid."
  else
    letters = string.split(//)
    flipped = []
    letters.each do |flip|
      flipped.unshift(letters[letters.index(flip)])
    end
    puts "The reverse of #{string} is #{flipped.join}."
  end
end

#reverse("fish")
#reverse(5.0)
#reverse("french horn")

def fibonacci(integer)
  sequence = []
  if integer == 0
    puts "Please enter a number above 0"
  elsif integer == 1
    puts "The first number in the Fibonacci Sequence is [0]"
  else
    first = 0
    second = 1
    counter = 0
    while counter < integer
      sequence << first
      increment = first + second
      first = second
      second = increment
      counter += 1
    end
    puts "The first #{integer.to_s} numbers in the Fibonacci Sequence are #{sequence}"
  end

end

#fibonacci(1)
#fibonacci(8)
#fibonacci(0)
#fibonacci(2)
