def my_reverse(string)
  reversed = ""
  letter = 0

  while letter < string.length
    reversed = string[letter] + reversed
    letter += 1
  end

  return reversed
end
