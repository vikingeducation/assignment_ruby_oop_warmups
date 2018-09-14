def reverse(string)
  rev = []
  letters = string.split("")
  (letters.length - 1).downto(0) do |x|
    rev.push(letters[x])
  end
puts  rev.join

  end
reverse("Blah!")
