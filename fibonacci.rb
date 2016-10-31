def fibs(times = 1)
  a = 0
  b = 1
  sequence = [0, 1]
  times.downto(3) do |i|
    c = a + b
    sequence.push(c)
    a = b
    b = c
  end
  return sequence
end

fibs(8)
