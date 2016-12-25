def fibs(n)
  return [0] if n == 0
  return [1] if n == 1
  fibs_nums_array = [0, 1]
  while fibs_nums_array.length < n
    fibs_nums_array << fibs_nums_array[-1] + fibs_nums_array[-2]
  end
  fibs_nums_array
end 


puts fibs(3)
puts fibs(8)