# Warmup 1: Ruby Methods

# my_reverse

def my_reverse(word)
  reversed_word = ""
  position = (word.length - 1)
  while position >= 0
    reversed_word += word[position]
    position -= 1
  end
  return reversed_word
# puts "reversed_word = #{reversed_word}"
end

result = my_reverse("Blah!")
puts "result = #{result}"


# Fibonacci sequence

def fibs(number)
  integer = [0,1]
  i = 2
  count = 0
  print "\n"
  while i < (number)
    count += 1
    integer[i] = integer[i-1] + integer[i-2]
    i = i + 1
  end
  return integer
end


result = fibs(3)
puts "fibs(3) = #{result}"


result = fibs(8)
puts "fibs(8) = #{result}"



