def my_reverse(input)
  letters = []
  letters_reversed = []
  letters = input.chars
  letters.length.times do
    letters_reversed << letters.pop
  end
  letters_reversed.join("")
end

p my_reverse("Blah!")