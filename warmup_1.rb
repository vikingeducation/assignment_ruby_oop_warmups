
def my_reverse(string)

  letters = string.split("")

  return_string = []

  letters.each do |letter|

    return_string.unshift(letter)

  end

  return_string.join("")

end

#p my_reverse "foo"
