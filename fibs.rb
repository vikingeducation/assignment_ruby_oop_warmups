def fibs(sequence_length)
  a = 0
  b = 1
  fibs = [a, b]
  (sequence_length - 2).times do
    fibs << (a + b)
    a = fibs[-2]
    b = fibs[-1]
  end
  fibs
end