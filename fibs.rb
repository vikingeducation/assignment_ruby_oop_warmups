def fibs(size=2, results=[0,1])
  size == results.length ?
  results : fibs(size, results.push(results[-1] + results[-2]))
end

puts(fibs(12))
