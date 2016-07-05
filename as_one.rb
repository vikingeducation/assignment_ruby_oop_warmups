def my_reverse(str)
  result = []
  str.chars.each{ |letter| result.unshift(letter) }
  result.join('')
end

def fibs(num)
  fibbs = [0,1]
  return fibbs[0] if num == 1
  (num - 2).times do
    fibbs << fibbs[-1] + fibbs[-2]
  end
  fibbs
end
