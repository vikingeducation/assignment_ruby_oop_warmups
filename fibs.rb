def fibs_helper(num)
  if num == 0 || num == 1
    return num
  else
    return fibs_helper(num - 1) + fibs_helper(num - 2)
  end
end

def fibs(num)
  arr = []
  num.times do |x|
    arr << fibs_helper(x)
  end
  return arr
end

print fibs(5)
puts