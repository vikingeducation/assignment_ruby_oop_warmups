def fibs(num)
  a, b = 0, 1
  return_array = []
  num.times do
    return_array << a
    a, b = b, a + b
  end
  return_array
end
