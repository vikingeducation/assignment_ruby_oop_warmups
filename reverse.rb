def my_reverse(string)
  rev = ""

  
  (1..string.length).each do |index|
    index *= -1
    rev += string[index]
  end

  rev
end

puts my_reverse("blagg!")