def fibs(count)
  return [0] if count == 1
  return [0, 1] if count == 2
  result = [0, 1]

  until result.length == count
    result << result.last(2).inject(:+)
  end

  result

end

puts fibs(12)