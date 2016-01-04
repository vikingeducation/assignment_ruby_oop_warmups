def fibs(num)
  
  arr = [0]
  curr = 1
  last = 0

  (1...num).each do  
    term = curr + last 
    curr = last
    last = term
    arr << term
  end

  arr
end

puts fibs(8)