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

  if num == 0
    sequence = [0]
  elsif num == 1
    sequence
  else
    (num-2).times do
      sequence << sequence[-1] + sequence[-2]
    end
  end

  return sequence
end

puts fibs(8).inspect
puts fibs(0).inspect
puts fibs(1).inspect