def my_reverse(string)
  reversed_string = []

  string.split("").each do |word|
    reversed_string.unshift(word)
  end

  reversed_string.join("")
end
