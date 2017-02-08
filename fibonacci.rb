def fibs(how_long)
  result = []
  how_long.times do
    if result.size == 0
      result << 0
    elsif result.size == 1
      result << 1
    else
      result << result[-1] + result[-2]
    end
  end
  result
end