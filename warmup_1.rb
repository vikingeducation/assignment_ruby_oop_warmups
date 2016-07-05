
def my_reverse(string)

  letters = string.split("")

  return_string = []

  letters.each do |letter|

    return_string.unshift(letter)

  end

  return_string.join("")

end

#p my_reverse "foo"

def fibonacci(num)
	result = [1]
	current = 1
	until num == 1
		result.push(current)
		current += result[result.length-2]
		num -= 1
	end
	return result
end
