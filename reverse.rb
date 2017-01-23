def reverse(string)
  rev = []
  word = string.split("")
  (word.length - 1).downto(0) do |x|
    rev.push(word[x])
  end
puts  rev.join

  end
reverse("Blah!")
