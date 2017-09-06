# Build a method that reverses any string you put into it, and don't use the built-in reverse.
def my_reverse(string)
  original = string.chars
  reversed = []
  while original.length > 0
    reversed << original.pop
  end
  reversed.join
end

my_reverse("Blah!")


# Write a method that takes an integer and spits out an array of that many elements of
# the Fibonacci Sequence, which starts with 0 and 1 and computes the next element by
# adding the most recent two elements together.
def fibs(input)
  output = [0, 1]
  while output.length < input
    output << (output[-2] + output[-1])
  end
  output
end

fibs(8)
