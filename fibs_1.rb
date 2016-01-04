def fibs(num)
  
  arr = [0,1]
  curr = 1
  last = 0

  num.times do  
    term << curr + last 
    curr = last
    last = term
  end

end