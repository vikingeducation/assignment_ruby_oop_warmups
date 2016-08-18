def my_reverse(string)
  char_array = string.chars.to_a
  reversed = *(1..char_array.size)
  char_array.each_with_index do |char, index|
    new_index = -(index + 1)
    reversed[new_index] = char
  end
  reversed.join("")
end