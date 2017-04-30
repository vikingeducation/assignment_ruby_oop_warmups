# Write a method that takes an integer and spits out an array of that many elements
# of the Fibonacci Sequence (http://en.wikipedia.org/wiki/Fibonacci_number), which
# starts with 0 and 1 and computes the next element by adding the most recent two
# elements together.

def fibonacci(n)
  sequence = []
  a, b = 0, 1
  (1..n).each do
    sequence.push(a)
    a, b = b, a + b
  end
  sequence
end



p fibonacci(3)
#=> [0,1,1]

p fibonacci(8)
#=> [0,1,1,2,3,5,8,13]