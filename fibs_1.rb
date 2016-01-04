def fibs(num)
  
  arr = []
  curr = 1
  last = 0
  term = 0

  (0...num).each do
    arr << term
    term = curr + last 
    last = curr
    curr = term
  end

  arr
end

puts fibs(8)