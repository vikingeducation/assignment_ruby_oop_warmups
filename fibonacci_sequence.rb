# Challenge : 
# Write a method that takes an integer and spits out an array of that many elements of the Fibonacci Sequence, which starts with 0 and 1 and computes the next element by adding the most recent two elements together.

# Solution : 
def fibs(num)
  fib_seq = [0, 1, 1]
  return fib_seq if fib_seq.length == num

  iterator = num - fib_seq.length
  iterator.times do
    fib_seq << fib_seq[-1] + fib_seq[-2]
  end
  fib_seq
end

fibs(3) ==  [0,1,1]
fibs(8) == [0,1,1,2,3,5,8,13]

