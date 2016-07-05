def my_reverse(str)
  result = []
  str.chars.each{ |letter| result.unshift(letter) }
  result.join('')
end
