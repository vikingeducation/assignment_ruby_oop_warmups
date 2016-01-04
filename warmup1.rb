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

# puts my_reverse("Blah")

def fibs(num)
  sequence = [0, 1]

  (num-2).times do
    sequence << sequence[-1] + sequence[-2]
  end

  return sequence
end

print fibs(8)