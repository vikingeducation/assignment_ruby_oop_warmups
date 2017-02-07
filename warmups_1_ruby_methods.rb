def my_reverse(string)
  reverse_string = ""

  i = -1
  string.length.times do
    reverse_string += string[i]
    i -= 1
  end

  reverse_string
end

def fibs(n)
  return [0] if n == 0
  return [0, 1] if n == 1
  return fibs(n - 1).push(fibs(n - 1)[-1] + fibs(n - 2)[-1])
end