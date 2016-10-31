def fib(num)
  return nil if num <= 0
  return 0 if num == 1
  seq = [0,1]

  while seq.length < num 
    seq << seq[-1] + seq[-2]
  end

  seq
end

puts fib(8)