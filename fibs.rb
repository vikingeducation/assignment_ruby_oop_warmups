# Takes an integer and spits out an array of that many elements of the Fibonacci Sequence, which starts with 0 and 1 and computes the next element by adding the most recent two elements together.
def fibs(counter)
  prev = 0
  current = 1
  seq = [prev, current]
  sum = 0

  counter-= 2

  counter.times do
    sum = prev + current
    seq.push(sum)
    prev = current
    current = sum
  end
  p seq
end

# puts fibs(2)
# puts fibs(4)
