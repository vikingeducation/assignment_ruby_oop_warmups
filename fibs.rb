=begin
  - Write a method
  - that takes an integer
  - and spits out an array of that many elements
  - of the Fibonacci Sequence
  - which starts with 0 and 1
  - and computes the next element by adding the most recent two elements together.

  e.g. fibs(3) = [0,1,1]
  fibs(8) = [0,1,1,2,3,5,8,13]

  BRAINSTORMING******
  - Start with 2 number in an array.
  - So that we can give answers for 0, I think we should start with two arrays.
    the answer array and the  starting numbers array.
=end

def fibs(number)
  if number <= 0
    fibonacci_sequence = []
  elsif number == 1
    fibonacci_sequence = [0]
  elsif number == 2
    fibonacci_sequence = [0,1]
  else
    fibonacci_sequence = [0,1]
    (number - 2).times {fibonacci_sequence.push(fibonacci_sequence[-1] + fibonacci_sequence[-2])}
  end
  fibonacci_sequence
end

print fibs(20)



