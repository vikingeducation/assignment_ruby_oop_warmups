def fibs(num)
  current = 0
  result = []

  num.times do
    result.push(current)
    current += result[-2] ? result[-2] : 1
  end

  result
end

puts fibs(8)