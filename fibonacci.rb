def fibonacci max=1
  fib=[0,1]
  return fib[0...max] if max < 3
  (2...max).each {|n| fib[n]= fib[n-1] + fib[n-2]}
  return fib
end

p fibonacci 2