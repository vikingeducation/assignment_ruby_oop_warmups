def my_reverse(string)
  letters = []

  string.split("").each do |letter|
      letters.unshift letter
  end

  letters.join("")
end



p my_reverse("Hello")


# Split the string
# Itereate through splitted string
# Push the last letter into the front of the new array
