def my_reverse(word)
  letters = word.split('')
  idx = letters.length
  reversed = []

  while idx > 0
    reversed << letters[idx-1]
    idx -=1
  end

  return reversed.join('')
end

puts my_reverse("Blah")